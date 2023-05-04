FROM debian:bullseye@sha256:63d62ae233b588d6b426b7b072d79d1306bfd02a72bff1fc045b8511cc89ee09

LABEL org.opencontainers.image.title="OpenVPN Client"
LABEL org.opencontainers.image.authors="Roberto Schiavone"
LABEL org.opencontainers.image.url="https://github.com/robertoschiavone/crocodile"

RUN apt update

RUN apt -y install openvpn

COPY client.ovpn /etc/openvpn/client/client.conf

ENTRYPOINT [ "openvpn", "--config", "/etc/openvpn/client/client.conf" ]

