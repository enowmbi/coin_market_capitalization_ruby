# frozen_string_literal: true

require_relative "lib/coin_market_capitalization/version"

Gem::Specification.new do |spec|
  spec.name = "coin_market_capitalization"
  spec.version = CoinMarketCapitalization::VERSION
  spec.authors = ["Enow Mbi"]
  spec.email = ["benowmbi@yahoo.com"]

  spec.summary = "Get todays's crptocurrencies by market cap using Ruby"
  spec.description = spec.summary
  spec.homepage = "https://github.com/enowmbi/coin_market_capitalization_ruby"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 1.10.2"
  spec.add_dependency "faraday_middleware", "~> 1.2"
  spec.add_development_dependency "pry"
end
