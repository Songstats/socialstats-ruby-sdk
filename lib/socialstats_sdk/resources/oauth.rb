# frozen_string_literal: true

require "uri"

module SocialstatsSDK
  module Resources
    class OAuth < Base
      def create(source_id:, **params)
        raise ArgumentError, "source_id is required" if source_id.to_s.empty?

        query = params.merge(source_id: source_id)
        require_any_identifier!(query, CREATOR_IDENTIFIER_KEYS)
        post("oauth", params: query)
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
