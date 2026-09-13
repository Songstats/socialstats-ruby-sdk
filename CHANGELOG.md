# Changelog

All notable changes to this project are documented in this file.

## Unreleased

### Fixed

- Route public post statistics through the source-specific API paths instead of nonexistent generic post endpoints.
- Retry only GET requests; ambiguous write failures are surfaced after one attempt.
- Disable Net::HTTP automatic retries so the SDK retry budget is enforced, and apply the configured timeout to socket writes.

### Added

- OAuth authorization lifecycle resource coverage
- Authorized creator and post resource methods
- Platform-specific creator ID and username selectors

## [0.1.0] - 2026-06-25

### Added

- Initial standalone Ruby SDK repo for Socialstats Enterprise API (`/enterprise/v1`)
- Resource coverage:
  - `info`
  - `creators`
  - `posts`
- Shared HTTP client with:
  - `apikey` header auth
  - JSON response decoding
  - retry/backoff on transport errors and retryable status codes
- Structured exception types for API and transport failures
- Route coverage audit doc mapping Rails routes to SDK methods
