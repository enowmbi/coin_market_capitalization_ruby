# frozen_string_literal: true

module CoinMarketCapitalization
  # Fiat class contains methods mapped to corresponding API endpoints for fiat currencies.
  # This category currently includes 1 endpoint
  class Fiat < Base
    BASE_URL = "https://pro-api.coinmarketcap.com/v1/fiat"

    def initialize(api_key:, base_url: BASE_URL, adapter: Faraday.default_adapter)
      super
    end

    def map(**args)
      make_request("map", **args)
    end
  end
end
