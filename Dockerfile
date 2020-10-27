FROM ubuntu:18.04

# To avoid "tzdata" asking for geographic area
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update -qq && \
    apt install -qq -y software-properties-common && \
    add-apt-repository -s "deb http://archive.ubuntu.com/ubuntu/ bionic main restricted" && \
    add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
    apt build-dep mesa -qq -y && \
    apt install -qq -y \
        git \
        gcc-10 \
        g++-10 \
        npm \
        libx264-dev \
        libjavascriptcoregtk-4.0-dev \
        kmscube \
        libgles2-mesa-dev \
        libgbm-dev \
        libudev-dev \
        llvm-dev \
        ninja-build \
        python3-pip 

RUN python3 -m pip install \
        mako \
        meson

ENV LD_LIBRARY_PATH=/usr/local/lib/x86_64-linux-gnu