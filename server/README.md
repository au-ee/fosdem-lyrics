# Fosdem Lyrics Server

This folder contains the server part of my presentation at Fosdem 2024.

With a few modifications, it should be possible for everyone to run a similar setup on a public server:

- Replace `live.fiftysix.site` by the hostname of the own server, here:
  - `docker-compose.yaml`
  - `caddy-conf/Caddyfile`
  - `nats-conf/nats-server.conf`
  - `caddy-wwwroot/lyrics.js`

- Set a custom Bcrypted password for the NATS user `publisher` in `nats-conf/nats-server.conf`. See [documentation](https://docs.nats.io/running-a-nats-service/configuration/securing_nats/auth_intro/username_password#bcrypted-passwords).

Running `docker compose up -d` starts the following services:

## Caddy web server

Which serves the following content:

- https://live.fiftysix.site - A static web site which subscribes to a message broker to show content received through messages

- https://live.fiftysix.site/nats - Reverse proxy for the system status site of the nats broker

Caddy automatically acquires a Let's Enyrypt TLS certificate for the site `live.fiftysix.site` which is also mapped to the NATS server container (see below).


# NATS server

NATS as a message broker, listening on

- nats://live.fiftysix.site:4222 - The native nats protocol with enforced TLS 

- wss://live.fiftysix.site:8443 - NATS over a TLS encrypted web socket

Since the host name matches the one of the web site, the certificate retrieved by the Caddy web server is also mapped into the NATS container.