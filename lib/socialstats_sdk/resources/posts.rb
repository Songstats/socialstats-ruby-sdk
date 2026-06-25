# frozen_string_literal: true

module SocialstatsSDK
  module Resources
    class Posts < Base
      CREATOR_IDENTIFIER_KEYS = %i[socialstats_creator_id].freeze
      POST_IDENTIFIER_KEYS = %i[post_id id_unique external_id].freeze

      def stats(source_id:, **params)
        get("posts/stats", params: with_post_identifier(params.merge(source_id: source_id)))
      end

      def historic_stats(source_id:, **params)
        get("posts/historic_stats", params: with_post_identifier(params.merge(source_id: source_id)))
      end

      private

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
