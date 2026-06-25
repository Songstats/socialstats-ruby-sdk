# frozen_string_literal: true

module SocialstatsSDK
  class SocialstatsError < StandardError; end

  class SocialstatsTransportError < SocialstatsError; end

  class SocialstatsAPIError < SocialstatsError
    attr_reader :status_code, :payload

    def initialize(message:, status_code:, payload: nil)
      @error_message = message
      super(@error_message)
      @status_code = status_code
      @payload = payload
    end

    def to_s
      "Socialstats API error (#{status_code}): #{@error_message}"
    end
  end
end
