# frozen_string_literal: true

require "uri"

module SocialstatsSDK
  module Resources
    class Posts < Base
      POST_IDENTIFIER_KEYS = %i[post_id id_unique external_id].freeze

      def stats(source_id:, **params)
        get(post_path(source_id, "stats"), params: with_post_identifier(params.merge(source_id: source_id)))
      end

      def historic_stats(source_id:, **params)
        get(post_path(source_id, "historic_stats"), params: with_post_identifier(params.merge(source_id: source_id)))
      end

      def authorized_stats(source_id:, **params)
        query = with_post_identifier(params.merge(source_id: source_id))
        get(post_path(source_id, "stats", authorized: true), params: query)
      end

      def authorized_historic_stats(source_id:, **params)
        query = with_post_identifier(params.merge(source_id: source_id))
        get(post_path(source_id, "historic_stats", authorized: true), params: query)
      end

      private

      def post_path(source_id, action, authorized: false)
        prefix = authorized ? "posts/authorized" : "posts"
        "#{prefix}/#{URI.encode_uri_component(source_id.to_s)}/#{action}"
      end

      def with_post_identifier(params)
        query = params.dup
        raise ArgumentError, "source_id is required" if query[:source_id].to_s.empty?

        require_any_identifier!(query, CREATOR_IDENTIFIER_KEYS)
        require_any_identifier!(query, POST_IDENTIFIER_KEYS)
        query
      end
    end
  end
end
