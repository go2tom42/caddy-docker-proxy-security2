ARG CADDY_VERSION=2.6.3

FROM caddy:${CADDY_VERSION}-builder-alpine AS builder

RUN xcaddy build 

FROM caddy:${CADDY_VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
