FROM ubuntu:bionic
CMD /bin/bash

# Sources
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
# Apt Update
RUN apt update

# Base Tools
RUN apt install vim tmux curl wget httpie

# Python Tools
RUN apt install python3

# C++ Tools
RUN apt install build-essential clang clang-format clang-tidy cmake
RUN pip3 install conan

# NodeJS Tools
RUN apt install yarn