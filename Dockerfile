FROM ubuntu:16.04
LABEL maintainer "yzy1111"
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Shanghai

RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list && \
apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y git gcc-arm-linux-gnueabihf u-boot-tools device-tree-compiler mtools \
parted libudev-dev libusb-1.0-0-dev python-linaro-image-tools linaro-image-tools libssl-dev \
autotools-dev libsigsegv2 m4 libdrm-dev curl sed make binutils build-essential gcc g++ bash \
patch gzip bzip2 perl tar cpio python unzip rsync file bc wget libncurses5 libglib2.0-dev openssh-client lib32stdc++6  \
vim repo \
    gcc-arm-linux-gnueabihf \
gcc-aarch64-linux-gnu device-tree-compiler lzop libncurses5-dev \
libssl1.0.0 libssl-dev python-dev python3-dev time expect liblz4-tool swig texinfo && \
rm -rf /var/lib/apt/lists/* &&  apt-get clean

RUN adduser --disabled-password --gecos '' docker && \
  usermod -aG sudo docker && \
  echo "docker ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER docker

RUN git config --global user.name "docker" && \
    git config --global user.email "" && \
    git config --global color.status "true"

WORKDIR /home/docker
