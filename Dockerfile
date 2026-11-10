# image
FROM hugomods/hugo:latest AS build
# sets the directory
WORKDIR /src 
# copies from the build context to previous directory, source and destination
COPY . .
# reads hugo.yaml and writes into /src/public, shrinking files
RUN hugo --minify 


# image
FROM caddy:2-alpine
# copies from build instead of locally, source and destination
COPY --from=build /src/public /srv
# copies into default config location
COPY Caddyfile /etc/caddy/Caddyfile
# documents the ports (http) and (https)
EXPOSE 80 443
