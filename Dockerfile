FROM hugomods/hugo:latest AS build
WORKDIR /src
COPY . .
RUN hugo --minify

FROM caddy:2-alpine
COPY --from=build /src/public /srv
COPY Caddyfile /etc/caddy/Caddyfile
EXPOSE 80 443
