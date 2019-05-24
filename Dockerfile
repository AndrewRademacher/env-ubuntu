FROM ubuntu:bionic
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