FROM debian:bullseye

RUN sed -i 's/main/main contrib non-free/g' /etc/apt/sources.list && \
    apt-get update && apt-get install -y \
    nmap \
    sqlmap \
    nikto \
    john \
    hydra \
    redis-tools \
    mariadb-client \
    smbclient \
    gobuster \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/share/wordlists

ADD https://raw.githubusercontent.com/3ndG4me/KaliLists/master/dirbuster/directory-list-lowercase-2.3-small.txt directory-list-lowercase-2.3-small.txt:57d97413d133a4c22d7e463b3347f8c12f45e36d8eba81aea3b7944e3411aa4c
ADD https://raw.githubusercontent.com/3ndG4me/KaliLists/master/dirbuster/directory-list-lowercase-2.3-medium.txt directory-list-lowercase-2.3-medium.txt:f48f0d560c5494c04a145b3240c8c227a6d3b43a96081c21e3f49098e147519b
ADD https://raw.githubusercontent.com/3ndG4me/KaliLists/master/dirbuster/directory-list-2.3-small.txt directory-list-2.3-small.txt:0153f0943064efd0de1be5ba1ded239e900db77936a3de397255e8e76a796a56
ADD https://raw.githubusercontent.com/3ndG4me/KaliLists/master/dirbuster/directory-list-2.3-medium.txt directory-list-2.3-medium.txt:54c4dd1a34b29bfb6dc3bf3cb6dda2f1a8d6a6823ea92c01c723f9ae21c742c5

WORKDIR /root

CMD ["/bin/bash"]

