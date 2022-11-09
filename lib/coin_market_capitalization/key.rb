# frozen_string_literal: true

module CoinMarketCapitalization
  # Key class - contains methods that map to API endpoints for managing your API key.
  # This category currently includes 1 endpoint
  class Key < Base
    BASE_URL = "https://pro-api.coinmarketcap.com/v1/key"

    def initialize(api_key:, base_url: BASE_URL, adapter: Faraday.default_adapter)
      super
    end

    def info(**args)
      make_request("info", **args)
    end
  end
end
