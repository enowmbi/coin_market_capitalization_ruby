# frozen_string_literal: true

require_relative "coin_market_cap/version"

# CoinMarketCap
module CoinMarketCap
  autoload(:Cryptocurrency, "coin_market_cap/cryptocurrency")
  autoload(:BadRequestException, "coin_market_cap/exceptions")
  autoload(:UnauthorizedException, "coin_market_cap/exceptions")
  autoload(:PaymentRequiredException, "coin_market_cap/exceptions")
  autoload(:ForbiddenException, "coin_market_cap/exceptions")
  autoload(:TooManyRequestsException, "coin_market_cap/exceptions")
  autoload(:ServerException, "coin_market_cap/exceptions")
end
