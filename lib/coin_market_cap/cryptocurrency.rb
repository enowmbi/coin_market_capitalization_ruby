# frozen_string_literal: true

require "faraday"
require "faraday_middleware"

module CoinMarketCap
  # Cryptocurrency
  class Cryptocurrency
    BASE_URL = "https://pro-api.coinmarketcap.com/v1/cryptocurrency"
    SIMPLE_END_POINTS = %w[
      map
      categories
      category
      airdrops
      airdrop
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

    SIMPLE_END_POINTS.each do |simple_end_point|
      define_method(simple_end_point.to_sym) do |**args|
        end_point = simple_end_point
        make_request(end_point, **args)
      end
    end

    # def map(**args)
    #   endpoint = "map"
    #   make_request(endpoint, **args)
    # end

    # def categories(**args)
    #   endpoint = "categories"
    #   make_request(endpoint, **args)
    # end

    # def category(**args)
    #   endpoint = "category"
    #   make_request(endpoint, **args)
    # end

    # def airdrops(**args)
    #   endpoint = "airdrops"
    #   make_request(endpoint, **args)
    # end

    # def airdrop(**args)
    #   endpoint = "airdrop"
    #   make_request(endpoint, **args)
    # end

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
