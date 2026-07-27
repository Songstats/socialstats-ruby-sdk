# frozen_string_literal: true

module SocialstatsSDK
  module Resources
    class Base
      CREATOR_IDENTIFIER_KEYS = %i[
        socialstats_creator_id
        instagram_creator_id
        facebook_creator_id
        youtube_creator_id
        tiktok_creator_id
      ].freeze

      def initialize(http_client)
        @http = http_client
      end

      private

      def get(path, params: nil)
        @http.request(:get, path, params: normalize_params(params))
      end
      alias request_get get

      def post(path, params: nil, json: nil)
        @http.request(:post, path, params: normalize_params(params), json: normalize_params(json))
      end

      def delete(path, params: nil)
        @http.request(:delete, path, params: normalize_params(params))
      end

      def normalize_params(params)
        return nil if params.blank?

        normalized = {}
        params.each do |key, value|
          next if value.nil?

          normalized[key] = case value
          when true then "true"
          when false then "false"
          when Array then value.map(&:to_s).join(",")
          else value
          end
        end

        normalized.empty? ? nil : normalized
      end

      def require_any_identifier!(params, identifier_keys)
        has_identifier = identifier_keys.any? do |key|
          value = params[key]
          !value.nil? && value != ""
        end
        return if has_identifier

        raise ArgumentError, "One identifier is required. Supported keys: #{identifier_keys.join(', ')}"
      end
    end
  end
end
