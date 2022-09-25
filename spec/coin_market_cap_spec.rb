# frozen_string_literal: true

RSpec.describe CoinMarketCap do
  it "has a version number" do
    expect(CoinMarketCap::VERSION).not_to be nil
  end
end
