# Enterprise Routes Audit (Socialstats Rails -> Ruby SDK)

Audited against:

- `/Users/Oskar/1001tl/config/routes.rb`
- `/Users/Oskar/1001tl/app/controllers/enterprise/v1/creators_controller.rb`
- `/Users/Oskar/1001tl/app/controllers/enterprise/v1/info_controller.rb`
- `/Users/Oskar/1001tl/app/controllers/enterprise/v1/enterprise_base_controller.rb`
- `/Users/Oskar/1001tl/docs/socialstats_openapi.yaml`

Authentication observed in Rails: `apikey` request header.

## `/enterprise/v1/info`

| HTTP | Route           | SDK Method                 |
| ---- | --------------- | -------------------------- |
| GET  | `/sources`      | `client.info.sources`      |
| GET  | `/status`       | `client.info.status`       |
| GET  | `/uptime_check` | `client.info.uptime_check` |
| GET  | `/definitions`  | `client.info.definitions`  |

## `/enterprise/v1/creators`

| HTTP   | Route               | SDK Method                                                 |
| ------ | ------------------- | ---------------------------------------------------------- |
| GET    | `/info`             | `client.creators.info(...)`                                |
| GET    | `/stats`            | `client.creators.stats(...)`                               |
| GET    | `/historic_stats`   | `client.creators.historic_stats(...)`                      |
| GET    | `/audience`         | `client.creators.audience(...)`                            |
| GET    | `/audience/details` | `client.creators.audience_details(country_code: ..., ...)` |
| GET    | `/activities`       | `client.creators.activities(...)`                          |
| GET    | `/content`          | `client.creators.content(...)`                             |
| GET    | `/authorized/stats` | `client.creators.authorized_stats(...)`                    |
| GET    | `/authorized/historic_stats` | `client.creators.authorized_historic_stats(...)`    |
| GET    | `/authorized/audience` | `client.creators.authorized_audience(...)`              |
| GET    | `/authorized/content` | `client.creators.authorized_content(...)`                |
| GET    | `/top_posts`        | `client.creators.top_posts(...)`                           |
| GET    | `/search`           | `client.creators.search(q: ..., ...)`                      |
| POST   | `/link_request`     | `client.creators.add_link_request(link: ..., ...)`         |
| DELETE | `/link_request`     | `client.creators.remove_link_request(link: ..., ...)`      |

## `/enterprise/v1/posts`

| HTTP | Route             | SDK Method                         |
| ---- | ----------------- | ---------------------------------- |
| GET  | `/stats`          | `client.posts.stats(...)`          |
| GET  | `/historic_stats` | `client.posts.historic_stats(...)` |
| GET  | `/authorized/:source_id/stats` | `client.posts.authorized_stats(...)` |
| GET  | `/authorized/:source_id/historic_stats` | `client.posts.authorized_historic_stats(...)` |

## `/enterprise/v1/oauth`

| HTTP   | Route                          | SDK Method                                  |
| ------ | ------------------------------ | ------------------------------------------- |
| POST   | `/oauth`                       | `client.oauth.create(...)`                  |
| GET    | `/oauth`                       | `client.oauth.list(...)`                    |
| GET    | `/oauth/:id`                   | `client.oauth.get(id)`                      |
| DELETE | `/oauth/:id`                   | `client.oauth.revoke(id)`                   |
| GET    | `/oauth-attempts/:state_token` | `client.oauth.attempt_status(state_token)`  |
