# frozen_string_literal: true

module CoinMarketCapitalization
  # BadRequestException
  class BadRequestException < StandardError
    def initialize(json)
      puts json["status"]["error_message"] || super
    end
  end

  # UnauthorizedException
  class UnauthorizedException < StandardError
    def initialize(json)
      puts json["status"]["error_message"] || super
    end
  end

  # PaymentRequiredException
  class PaymentRequiredException < StandardError
    def initialize(json)
      puts json["status"]["error_message"] || super
    end
  end

  # ForbiddenException
  class ForbiddenException < StandardError
    def initialize(json)
      puts json["status"]["error_message"] || super
    end
  end

  # TooManyRequestsException
  class TooManayRequestsException < StandardError
    def initialize(json)
      puts json["status"]["error_message"] || super
    end
  end

  # InternalServerError
  class ServerException < StandardError
    def initialize(json)
      puts json["status"]["error_message"] || super
    end
  end
end
