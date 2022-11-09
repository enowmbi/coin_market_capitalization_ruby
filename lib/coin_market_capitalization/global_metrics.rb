# frozen_string_literal: true

module CoinMarketCapitalization
  # GlobalMetrics class containing methods that map to API endpoints for global aggregate market data.
  # This category currently includes 2 endpoints
  class GlobalMetrics < Base
    BASE_URL = "https://pro-api.coinmarketcap.com/v1/global-metrics"
    END_POINT_ENTRIES = %w[
      quotes/latest
      quotes/historical
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
