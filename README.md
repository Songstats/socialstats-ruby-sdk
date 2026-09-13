# Socialstats Ruby SDK

Official Ruby client for the **Socialstats Enterprise API**.

RubyGems: https://rubygems.org/gems/socialstats-ruby-sdk  
API Documentation: https://developers.stats.company/socialstats<br>
API Key Access: Please contact api@socialstats.com

---

## Requirements

- Ruby >= 3.2

---

## Installation

Add to your `Gemfile`:

    gem "socialstats-ruby-sdk"

Then install:

    bundle install

Or install directly via RubyGems:

    gem install socialstats-ruby-sdk

---

## Quick Start

    require "socialstats_sdk"

    client = SocialstatsSDK::Client.new(
      api_key: ENV["SOCIALSTATS_API_KEY"]
    )

    # API status
    status = client.info.status

    # Creator information
    creator = client.creators.info(
      socialstats_creator_id: "d3rvjgk2"
    )

    # Creator statistics
    creator_stats = client.creators.stats(
      socialstats_creator_id: "d3rvjgk2",
      source: "instagram"
    )

    # Post statistics
    post_stats = client.posts.stats(
      socialstats_creator_id: "d3rvjgk2",
      source_id: "tiktok",
      post_id: "7654234001833610518"
    )

    # Start and poll a creator authorization
    authorization = client.oauth.create(
      socialstats_creator_id: "d3rvjgk2",
      source_id: "youtube",
      return_url: "https://customer.example.com/socialstats/oauth-return"
    )
    authorization_status = client.oauth.attempt_status(authorization["state_token"])

---

## Authentication

All requests include your API key in the `apikey` header.

You can generate an API key in your Socialstats Enterprise dashboard.

We recommend storing your key securely in environment variables:

    export SOCIALSTATS_API_KEY=your_key_here

---

## Available Resource Clients

- `client.info`
- `client.creators`
- `client.posts`
- `client.oauth`

Creator-scoped methods accept `socialstats_creator_id`, `instagram_creator_id`, `facebook_creator_id`, `youtube_creator_id`, or `tiktok_creator_id`. Platform-specific identifiers may be either the platform's internal ID or its username.

Info endpoints:
- `client.info.sources` -> `/sources`
- `client.info.status` -> `/status`
- `client.info.uptime_check` -> `/uptime_check`
- `client.info.definitions` -> `/definitions`

Creator endpoints:
- `client.creators.info(...)` -> `/creators/info`
- `client.creators.stats(...)` -> `/creators/stats`
- `client.creators.historic_stats(...)` -> `/creators/historic_stats`
- `client.creators.audience(...)` -> `/creators/audience`
- `client.creators.audience_details(country_code: ..., ...)` -> `/creators/audience/details`
- `client.creators.activities(...)` -> `/creators/activities`
- `client.creators.content(...)` -> `/creators/content`
- `client.creators.authorized_stats(...)` -> `/creators/authorized/stats`
- `client.creators.authorized_historic_stats(...)` -> `/creators/authorized/historic_stats`
- `client.creators.authorized_audience(...)` -> `/creators/authorized/audience`
- `client.creators.authorized_content(...)` -> `/creators/authorized/content`
- `client.creators.top_posts(...)` -> `/creators/top_posts`
- `client.creators.search(q: ..., ...)` -> `/creators/search`
- `client.creators.add_link_request(link: ..., ...)` -> `/creators/link_request`
- `client.creators.remove_link_request(link: ..., ...)` -> `/creators/link_request`

Post endpoints:
- `client.posts.stats(...)` -> `/posts/stats`
- `client.posts.historic_stats(...)` -> `/posts/historic_stats`
- `client.posts.authorized_stats(...)` -> `/posts/authorized/{source_id}/stats`
- `client.posts.authorized_historic_stats(...)` -> `/posts/authorized/{source_id}/historic_stats`

OAuth endpoints:
- `client.oauth.create(...)` -> `POST /oauth`
- `client.oauth.list(...)` -> `GET /oauth`
- `client.oauth.get(...)` -> `GET /oauth/{id}`
- `client.oauth.revoke(...)` -> `DELETE /oauth/{id}`
- `client.oauth.attempt_status(...)` -> `GET /oauth-attempts/{state_token}`

---

## Error Handling

    begin
      client.creators.info(socialstats_creator_id: "invalid")
    rescue SocialstatsSDK::SocialstatsAPIError => e
      puts "API error: #{e.message}"
    rescue SocialstatsSDK::SocialstatsTransportError => e
      puts "Transport error: #{e.message}"
    end

---

## Development

To work on the SDK locally:

    git clone https://github.com/songstats/socialstats-ruby-sdk.git
    cd socialstats-ruby-sdk
    bundle install

---

## Versioning

This SDK follows Semantic Versioning (SemVer).

---

## License

MIT

The client runs in plain Ruby without Rails or Active Support. Request parameters accept a hash or `nil`; empty hashes and nil-valued entries are omitted.

## Request retries

`max_retries` applies only to GET requests. Write requests are attempted once
because a transport failure or server error can occur after a write has already
succeeded. Check the resulting state before retrying a write.
