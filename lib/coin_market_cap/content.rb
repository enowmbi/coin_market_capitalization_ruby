# frozen_string_literal: true

module CoinMarketCap
  # Content class - contains methods that map to API endpoints for content data.
  # This category currently includes 4 endpoints
  class Content < Base
    BASE_URL = "https://pro-api.coinmarketcap.com/v1/content"
    END_POINT_ENTRIES = %w[
      latest
      posts/top
      posts/latest
      posts/comments
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
