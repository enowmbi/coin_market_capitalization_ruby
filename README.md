[![Gem Version](https://badge.fury.io/rb/coin_market_capitalization.svg)](https://badge.fury.io/rb/coin_market_capitalization)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-community-brightgreen.svg)](https://rubystyle.guide)
[![Ruby on Rails CI](https://github.com/enowmbi/coin_market_capitalization_ruby/actions/workflows/ruby.yml/badge.svg)](https://github.com/enowmbi/coin_market_capitalization_ruby/actions/workflows/ruby.yml)

# CoinMarketCapitalization
Ruby client library for accessing Coin Market Cap API.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add coin_market_capitalization

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install coin_market_capitalization

## Usage
### Initialisation
The "api_key", "base_url" and an "adapter" are parameters used in the initialisation method. There is a default base_url and adapter provided for each class so you don't need to specify it when you create an object.You can use a different base_url and/or adapter when calling the initialisation method.
```ruby
BASE_URL = "https://pro-api.coinmarketcap.com/v1/blockchain"

def initialize(api_key:, base_url: BASE_URL, adapter: Faraday.default_adapter)
  @api_key = api_key
  @base_url = base_url
  @adapter = adapter
end
```

### Available Classes(Representing endpoint Categories)
### 1. Cryptocurrency 
Represents the "cryptocurrency" endpoint category.
This class contains methods (representing endpoints) that return data around cryptocurrencies such as ordered cryptocurrency lists or price and volume data.

```ruby
cryptocurrency = CoinMarketCapitalization::Cryptocurrency.new(api_key: "PUT_YOUR_API_KEY_HERE")
cryptocurrency.listings_latest
# represents "/cryptocurrency/listings/latest" - Returns a paginated list of all active cryptocurrencies with latest market data.  
```

### 2. Exchange
Represents the "exchange" endpoint category.
This class has methods (representing endpoints) that return data around cryptocurrency exchanges such as ordered exchange lists and market pair data.

```ruby
exchange = CoinMarketCapitalization::Exchange.new(api_key: "PUT_YOUR_API_KEY_HERE")
exchange.quotes_latest
# represents  "/exchange/quotes/latest" - Returns the latest aggregate market data for 1 or more exchanges.
```

### 3. GlobalMetrics
Represents the "global-metrics" endpoint category.
This class has methods (representing endpoints) that return aggregate market data such as global market cap and BTC dominance.

```ruby
global_metrics = CoinMarketCapitalization::GlobalMetrics.new(api_key: "PUT_YOUR_API_KEY_HERE")
global_metrics.quotes_latest
# represents  "/global-metrics/quotes/latest" - Returns the latest global cryptocurrency market metrics
```

### 4. Blockchain
Represents the "blockchain" endpoint category.
This class has methods (representing endpoints) that return data block explorer related data for blockchains

```ruby
blockchain = CoinMarketCapitalization::Blockchain.new(api_key: "PUT_YOUR_API_KEY_HERE")
blockchain.statistics_latest
# represents "/blockchain/statistics/latest" - Returns the latest blockchain statistics data for 1 or more blockchains. Bitcoin, Litecoin, and Ethereum are currently supported. 
```

### 5. Fiat
Represents the "fiat" endpoint category.
This class has methods (representing endpoints) that return data around fiats currencies including mapping to CMC IDs.

```ruby
fiat = CoinMarketCapitalization::Fiat.new(api_key: "PUT_YOUR_API_KEY_HERE")
fiat.map
# represents "/fiat/map" - Returns a mapping of all supported fiat currencies to unique CoinMarketCap ids 
```

### 6. Content 
Represents the "content" endpoint category.
This class has methods (representing endpoints) that return cryptocurrency-related news, headlines, articles, posts, and comments.

```ruby
content = CoinMarketCapitalization::Content.new(api_key: "PUT_YOUR_API_KEY_HERE")
content.latest
# represents "/content/latest" - Returns a paginated list of content pulled from CMC News/Headlines and Alexandria articles. 
```

### 7. key
Represents the "key" endpoint category.
This class has methods (representing endpoints) for API key administration (to review and manage your usage).

```ruby
key = CoinMarketCapitalization::Key.new(api_key: "PUT_YOUR_API_KEY_HERE")
key.info
# represents "/key/info" - Returns API key details and usage stats.  
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/enowmbi/coin_market_capitalization. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/coin_market_capitalization/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the coinMarketCapitalization project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/coin_market_capitalization/blob/master/CODE_OF_CONDUCT.md).
