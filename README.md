# Socialstats Ruby SDK

Official Ruby client for the **Socialstats Enterprise API**.

RubyGems: https://rubygems.org/gems/socialstats-ruby-sdk  
API Documentation: https://docs.socialstats.com  
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

Info endpoints:
- `client.info.sources` -> `/sources`
- `client.info.status` -> `/status`
- `client.info.definitions` -> `/definitions`

Creator endpoints:
- `client.creators.info(...)` -> `/creators/info`
- `client.creators.stats(...)` -> `/creators/stats`
- `client.creators.historic_stats(...)` -> `/creators/historic_stats`
- `client.creators.audience(...)` -> `/creators/audience`
- `client.creators.audience_details(country_code: ..., ...)` -> `/creators/audience/details`
- `client.creators.activities(...)` -> `/creators/activities`
- `client.creators.content(...)` -> `/creators/content`
- `client.creators.top_posts(...)` -> `/creators/top_posts`
- `client.creators.search(q: ..., ...)` -> `/creators/search`
- `client.creators.add_link_request(link: ..., ...)` -> `/creators/link_request`
- `client.creators.remove_link_request(link: ..., ...)` -> `/creators/link_request`

Post endpoints:
- `client.posts.stats(...)` -> `/posts/stats`
- `client.posts.historic_stats(...)` -> `/posts/historic_stats`

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
