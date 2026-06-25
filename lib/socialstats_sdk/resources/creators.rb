# frozen_string_literal: true

module SocialstatsSDK
  module Resources
    class Creators < Base
      IDENTIFIER_KEYS = %i[socialstats_creator_id].freeze

      def info(**params)
        get("creators/info", params: with_identifier(params))
      end

      def stats(**params)
        get("creators/stats", params: with_identifier(params))
      end

      def historic_stats(**params)
        get("creators/historic_stats", params: with_identifier(params))
      end

      def audience(**params)
        get("creators/audience", params: with_identifier(params))
      end

      def audience_details(country_code:, **params)
        raise ArgumentError, "country_code is required" if country_code.to_s.empty?

        query = with_identifier(params)
        query[:country_code] = country_code
        get("creators/audience/details", params: query)
      end

      def activities(**params)
        get("creators/activities", params: with_identifier(params))
      end

      def content(**params)
        get("creators/content", params: with_identifier(params))
      end

      def top_posts(**params)
        get("creators/top_posts", params: with_identifier(params))
      end

      def search(q:, **params)
        raise ArgumentError, "q is required" if q.to_s.empty?

        get("creators/search", params: params.merge(q: q))
      end

      def add_link_request(link:, **params)
        raise ArgumentError, "link is required" if link.to_s.empty?

        query = with_identifier(params)
        query[:link] = link
        post("creators/link_request", params: query)
      end

      def remove_link_request(link:, **params)
        raise ArgumentError, "link is required" if link.to_s.empty?

        query = with_identifier(params)
        query[:link] = link
        delete("creators/link_request", params: query)
      end

      private

      def with_identifier(params)
        query = params.dup
        require_any_identifier!(query, IDENTIFIER_KEYS)
        query
      end
    end
  end
end
