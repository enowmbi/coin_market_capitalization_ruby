# frozen_string_literal: true

module CoinMarketCap
  # Cryptocurrency
  class Cryptocurrency < Base
    BASE_URL = "https://pro-api.coinmarketcap.com/v1/cryptocurrency"

    END_POINT_ENTRIES = %w[
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

    def initialize(api_key:, base_url: BASE_URL, adapter: Faraday.default_adapter)
      super
    end

    END_POINT_ENTRIES.each do |end_point|
      define_method(end_point.tr("/,-", "_").to_sym) do |**args|
        make_request(end_point, **args)
      end
    end
  end
end
