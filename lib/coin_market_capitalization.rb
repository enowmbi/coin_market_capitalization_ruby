# frozen_string_literal: true

require_relative "coin_market_capitalization/version"

# CoinMarketCap - autoloads classes
module CoinMarketCapitalization
  autoload(:Base, "coin_market_capitalization/base")
  autoload(:Cryptocurrency, "coin_market_capitalization/cryptocurrency")
  autoload(:Fiat, "coin_market_capitalization/fiat")
  autoload(:Exchange, "coin_market_capitalization/exchange")
  autoload(:GlobalMetrics, "coin_market_capitalization/global_metrics")
  autoload(:Blockchain, "coin_market_capitalization/blockchain")
  autoload(:Content, "coin_market_capitalization/content")
  autoload(:Key, "coin_market_capitalization/key")
  autoload(:BadRequestException, "coin_market_capitalization/exceptions")
  autoload(:UnauthorizedException, "coin_market_capitalization/exceptions")
  autoload(:PaymentRequiredException, "coin_market_capitalization/exceptions")
  autoload(:ForbiddenException, "coin_market_capitalization/exceptions")
  autoload(:TooManyRequestsException, "coin_market_capitalization/exceptions")
  autoload(:ServerException, "coin_market_capitalization/exceptions")
end
