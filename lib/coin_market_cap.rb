# frozen_string_literal: true

require_relative "coin_market_cap/version"

# CoinMarketCap - autoloads classes
module CoinMarketCap
  autoload(:Base, "coin_market_cap/base")
  autoload(:Cryptocurrency, "coin_market_cap/cryptocurrency")
  autoload(:Fiat, "coin_market_cap/fiat")
  autoload(:Exchange, "coin_market_cap/exchange")
  autoload(:GlobalMetrics, "coin_market_cap/global_metrics")
  autoload(:Blockchain, "coin_market_cap/blockchain")
  autoload(:Content, "coin_market_cap/content")
  autoload(:Key, "coin_market_cap/key")
  autoload(:BadRequestException, "coin_market_cap/exceptions")
  autoload(:UnauthorizedException, "coin_market_cap/exceptions")
  autoload(:PaymentRequiredException, "coin_market_cap/exceptions")
  autoload(:ForbiddenException, "coin_market_cap/exceptions")
  autoload(:TooManyRequestsException, "coin_market_cap/exceptions")
  autoload(:ServerException, "coin_market_cap/exceptions")
end
