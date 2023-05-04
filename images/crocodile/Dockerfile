FROM golang:bullseye@sha256:dc0e5071d6d9e67dbe71cd41aaa700ef9874fb076141a87c62b10cfd3a7303fd as go-build
RUN go install github.com/OJ/gobuster/v3@latest
RUN cp $GOPATH/bin/gobuster /usr/local/bin/

FROM debian:bullseye@sha256:63d62ae233b588d6b426b7b072d79d1306bfd02a72bff1fc045b8511cc89ee09

LABEL org.opencontainers.image.title="Crocodile"
LABEL org.opencontainers.image.authors="Roberto Schiavone"
LABEL org.opencontainers.image.url="https://github.com/robertoschiavone/crocodile"

RUN sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list
RUN apt update

RUN apt install -y awscli
RUN apt install -y curl
RUN apt install -y expect
RUN apt install -y ftp
RUN apt install -y git
RUN apt install -y golang
RUN apt install -y hashcat
RUN apt install -y hydra
RUN apt install -y inetutils-ping
RUN apt install -y john
RUN apt install -y mariadb-client
RUN apt install -y nano
RUN apt install -y net-tools
RUN apt install -y netcat
RUN apt install -y nikto
RUN apt install -y nmap
RUN apt install -y python3-pip
RUN apt install -y redis-tools
RUN apt install -y ruby-dev
RUN apt install -y smbclient
RUN apt install -y sqlmap
RUN apt install -y telnet
RUN apt install -y tmux 
RUN apt install -y vim
RUN apt install -y wget

RUN rm -rf /var/lib/apt/lists/*

COPY --from=go-build /usr/local/bin/gobuster /usr/local/bin/

WORKDIR /usr/share
RUN git clone https://github.com/3ndG4me/KaliLists wordlists

WORKDIR /usr/share/wordlists
ADD https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt .

WORKDIR /usr/share
RUN git clone https://github.com/danielmiessler/SecLists seclists

WORKDIR /root

RUN pip install netifaces
RUN git clone https://github.com/lgandx/Responder

COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

ADD scripts scripts
RUN chmod +x /root/scripts/* 

ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "/root/entrypoint.sh" ]

