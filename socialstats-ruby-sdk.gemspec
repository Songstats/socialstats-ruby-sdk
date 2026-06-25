require_relative "lib/socialstats_sdk/version"

Gem::Specification.new do |spec|
  spec.name = "socialstats-ruby-sdk"
  spec.version = SocialstatsSDK::VERSION
  spec.authors = ["Songstats"]
  spec.email = ["api@socialstats.com"]

  spec.summary = "Ruby SDK for the Socialstats Enterprise API."
  spec.description = "Typed Ruby client for Socialstats Enterprise API resources."
  spec.homepage = "https://socialstats.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/songstats/socialstats-ruby-sdk"
  spec.metadata["bug_tracker_uri"] = "https://github.com/songstats/socialstats-ruby-sdk/issues"
  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir.chdir(__dir__) do
    Dir[
      "lib/**/*",
      "docs/**/*",
      "README.md",
      "CHANGELOG.md",
      "LICENSE"
    ]
  end

  spec.require_paths = ["lib"]
end
