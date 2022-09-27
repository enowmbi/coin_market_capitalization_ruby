# frozen_string_literal: true

module CoinMarketCap
  # Exchange class - contains methods mapped to API endpoints for cryptocurrency exchanges.
  # This category currently includes 6 endpoints
  class Exchange < Base
    BASE_URL = "https://pro-api.coinmarketcap.com/v1/exchange"
    END_POINT_ENTRIES = %w[
      map
      info
      listings/latest
      quotes/latest
      quotes/historical
      market-pairs/latest
    ].freeze

    def initialize(api_key:, base_url: BASE_URL, adapter: Faraday.default_adapter)
      super
    end

    END_POINT_ENTRIES.each do |end_point|
      define_method(end_point.tr("/-", "_").to_sym) do |**args|
        make_request(end_point, **args)
      end
    end
  end
end
