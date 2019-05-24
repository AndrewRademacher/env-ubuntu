FROM ubuntu:bionic
ENV DEBIAN_FRONTEND noninteractive
CMD /bin/bash

RUN apt-get update

# Base Tools
RUN apt-get -y install vim tmux curl wget httpie

# Python Tools
RUN apt-get -y install python3 python3-pip

# C++ Tools
RUN apt-get -y install build-essential clang clang-format clang-tidy cmake
RUN pip3 install conan

# NodeJS Tools
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update
RUN apt-get -y install yarn

# Certbot
RUN apt-get -y install software-properties-common
RUN add-apt-repository universe
RUN add-apt-repository ppa:certbot/certbot
RUN apt-get update
RUN apt-get -y install python3-certbot python3-certbot-nginx python3-certbot-dns-digitalocean python3-certbot-dns-route53

# Cloud CLIs
RUN apt-get -y install awscli
RUN curl -sL https://github.com/digitalocean/doctl/releases/download/v1.18.0/doctl-1.18.0-linux-amd64.tar.gz | tar -xzv \
	&& mv doctl /usr/local/bin

