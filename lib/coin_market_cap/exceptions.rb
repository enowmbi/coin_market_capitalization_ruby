# frozen_string_literal: true

module CoinMarketCap
  # BadRequestException
  class BadRequestException < StandardError
    def initialize(json)
      super
      puts json["status"]["error_message"]
    end
  end

  # UnauthorizedException
  class UnauthorizedException < StandardError
    def initialize(json)
      super
      puts json["status"]["error_message"]
    end
  end

  # PaymentRequiredException
  class PaymentRequiredException < StandardError
    def initialize(json)
      super
      puts json["status"]["error_message"]
    end
  end

  # ForbiddenException
  class ForbiddenException < StandardError
    def initialize(json)
      super
      puts json["status"]["error_message"]
    end
  end

  # TooManyRequestsException
  class TooManayRequestsException < StandardError
    def initialize(json)
      super
      puts json["status"]["error_message"]
    end
  end

  # InternalServerError
  class ServerException < StandardError
    def initialize(json)
      super
      puts json["status"]["error_message"]
    end
  end
end
