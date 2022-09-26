# frozen_string_literal: true

module CoinMarketCap
  # BadRequestException
  class BadRequestException < StandardError
    def initialize(status_json)
      super
      puts status_json["error_message"]
    end
  end

  # UnauthorizedException
  class UnauthorizedException < StandardError
    def initialize(status_json)
      super
      puts status_json["error_message"]
    end
  end

  # PaymentRequiredException
  class PaymentRequiredException < StandardError
    def initialize(status_json)
      super
      puts status_json["error_message"]
    end
  end

  # ForbiddenException
  class ForbiddenException < StandardError
    def initialize(status_json)
      super
      puts status_json["error_message"]
    end
  end

  # TooManyRequestsException
  class TooManayRequestsException < StandardError
    def initialize(status_json)
      super
      puts status_json["error_message"]
    end
  end

  # InternalServerError
  class InternalServerException < StandardError
    def initialize(status_json)
      super
      puts status_json["error_message"]
    end
  end
end
