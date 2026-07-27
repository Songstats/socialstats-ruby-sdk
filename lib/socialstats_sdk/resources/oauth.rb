# frozen_string_literal: true

require "uri"

module SocialstatsSDK
  module Resources
    class OAuth < Base
      def create(socialstats_creator_id:, source_id:, **params)
        raise ArgumentError, "socialstats_creator_id is required" if socialstats_creator_id.to_s.empty?
        raise ArgumentError, "source_id is required" if source_id.to_s.empty?

        post("oauth", params: params.merge(socialstats_creator_id: socialstats_creator_id, source_id: source_id))
      end

      def list(**params)
        request_get("oauth", params: params)
      end

      def get(authorization_id)
        raise ArgumentError, "authorization_id is required" if authorization_id.to_s.empty?

        request_get("oauth/#{escape(authorization_id)}")
      end

      def revoke(authorization_id)
        raise ArgumentError, "authorization_id is required" if authorization_id.to_s.empty?

        delete("oauth/#{escape(authorization_id)}")
      end

      def attempt_status(state_token)
        raise ArgumentError, "state_token is required" if state_token.to_s.empty?

        request_get("oauth-attempts/#{escape(state_token)}")
      end

      private

      def escape(value)
        URI.encode_uri_component(value.to_s)
      end
    end
  end
end
