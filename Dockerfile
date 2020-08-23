# ----------------------------------
# Pterodactyl Core Dockerfile
# Environment: Java (glibc support)
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        python:3-alpine

LABEL       author="Michael Parker" maintainer="docker@parkervcp.com"
            # install chromedriver
RUN         apk add chromium chromium-chromedriver

            # upgrade pip
RUN         pip install --upgrade pip

            # install selenium
RUN         pip install selenium

RUN         apk add --no-cache --update sudo tar curl wget git screen xvfb htop \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/ash", "/entrypoint.sh"]
