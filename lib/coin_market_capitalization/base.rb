# frozen_string_literal: true

require "faraday"
require "faraday_middleware"

module CoinMarketCap
  # Base class
  class Base
    attr_reader :api_key, :base_url, :adapter

    def initialize(api_key:, base_url:, adapter: Faraday.default_adapter)
      @api_key = api_key
      @base_url = base_url
      @adapter = adapter
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = base_url
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter adapter
      end
    end

    private

    def make_request(end_point, **query_params)
      response = connection.get(end_point, query_params) do |request|
        request.headers["X-CMC_PRO_API_KEY"] = api_key
      end

      if response.status == 200
        response.body
      else
        raise_exception(response)
      end
    end

    def raise_exception(response)
      case response.status
      when 400 then raise BadRequestException, response.body
      when 401 then raise UnauthorizedException, response.body
      when 402 then raise PaymentRequiredException, response.body
      when 403 then raise ForbiddenException, response.body
      when 429 then raise TooManyRequestsException, response.body
      when 500 then raise ServerException, response.body
      end
    end
  end
end
