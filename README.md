# NGINX Rate Limiter proxy

Dockerized nginx proxy which applies a rate limit. It forwards all requests to your configured proxy pass url. It uses [nginx rate limiting](https://www.nginx.com/blog/rate-limiting-nginx/) to limit the number of requests that are actually being send through.

## Usage

```yaml
version: '3'

services:
  ratelimit-proxy:
    image: 'webbits/nginx-ratelimiter-proxy'
    environment:
      PROXY_REQUESTS_PER_SECOND_LIMIT: 1
      PROXY_BURST: 2
      PROXY_PASS_URL: https://the-real-api.com
```

The proxy is now accesible in your other containers via `http://ratelimit-proxy:80`.

## Environment variables

| | Description | Default value |
|---|---|---|
| **PROXY_REQUESTS_PER_SECOND_LIMIT** | How many requests per second are allowed. | `10` |
| **PROXY_BURST** | How much requests should build up in a queue after the per second limit is reached. | `50` |
| **PROXY_PASS_UR**L | The URL that should be proxied. | `https://api.ipify.org/?format=json` |

## Warning

Only use the proxy internally and do not expose it to the outside world. The proxy does not use https and is therefor vulnerable outside of your internal network.