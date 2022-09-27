# frozen_string_literal: true

module CoinMarketCap
  # Blockchain class - contains methods that map to API endpoints for blockchain data.
  # This category currently includes 1 endpoint
  class Blockchain < Base
    BASE_URL = "https://pro-api.coinmarketcap.com/v1/blockchain"

    def initialize(api_key:, base_url: BASE_URL, adapter: Faraday.default_adapter)
      super
    end

    def statistics_latest(**args)
      make_request("statistics/latest", **args)
    end
  end
end
