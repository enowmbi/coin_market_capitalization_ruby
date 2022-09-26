# frozen_string_literal: true

require "faraday"
require "faraday_middleware"

module CoinMarketCap
  # Cryptocurrency
  class Cryptocurrency
    BASE_URL = "https://pro-api.coinmarketcap.com/v1/cryptocurrency"

    END_POINTS = %w[
      map
      categories
      category
      airdrops
      airdrop
      listings/latest
      listings/historical
      trending/latest
      trending/most-visited
      trending/gainers-losers
    ].freeze

    attr_reader :api_key, :adapter

    def initialize(api_key:, adapter: Faraday.default_adapter)
      @api_key = api_key
      @adapter = adapter
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = BASE_URL
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter adapter
      end
    end

    END_POINTS.each do |end_point|
      define_method(end_point.tr("/,-", "_").to_sym) do |**args|
        make_request(end_point, **args)
      end
    end

    private

    def make_request(endpoint, **query_params)
      response = connection.get(endpoint, query_params) do |request|
        request.headers["X-CMC_PRO_API_KEY"] = api_key
      end

      case response.status
      when 200
        return response.body
      when 400
        raise BadRequestException, response.body
      when 401
        raise UnauthorizedException, response.body
      when 402
        raise PaymentRequiredException, response.body
      when 403
        raise ForbiddenException, response.body
      when 429
        raise TooManyRequestsException, response.body
      when 500
        raise ServerException, response.body
      end
      response.body
    end
  end
end
