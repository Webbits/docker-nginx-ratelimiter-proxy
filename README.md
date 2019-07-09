# Docker nginx env container

Docker image for running nginx with env variables in the conf. It forwards all requests to your configured proxy pass url. It uses [nginx rate limiting](https://www.nginx.com/blog/rate-limiting-nginx/) to limit the number of requests that are actually being send through.

## Usage

```yaml
version: '3'

services:
  your-app:
    image: '-your-app-image'
    environment:
      SOME_API_URL: http://ratelimit-proxy:80
  ratelimit-proxy:
    build: ./..
    environment:
      PROXY_REQUESTS_PER_SECOND_LIMIT: 1
      PROXY_BURST: 2
      PROXY_PASS_URL: https://the-real-api.com
```

## ENV Vars

| Name | Description | Default value |
|---|---|---|
| PROXY_REQUESTS_PER_SECOND_LIMIT | How many requests per second are allowed. | `10` |
| PROXY_BURST | How much requests should build up in a queue after the per second limit is reached. | `50` |
| PROXY_PASS_URL | The URL that should be proxied. | `https://api.ipify.org/?format=json` |