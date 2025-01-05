FROM i386/ubuntu:20.04
SHELL ["/bin/bash", "-c"]

ENV DEBIAN_FRONTEND=noninteractive
RUN sed -i 's#http://archive.ubuntu.com#http://mirrors.tuna.tsinghua.edu.cn#g' /etc/apt/sources.list && \
    sed -i 's#http://security.ubuntu.com#http://mirrors.tuna.tsinghua.edu.cn#g' /etc/apt/sources.list && \
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    apt-get update && apt-get install -y build-essential git curl && \
    curl -L -O https://redirect.armbian.com/_toolchain/gcc-linaro-arm-none-eabi-4.8-2014.04_linux.tar.xz && \
    tar xf gcc-linaro-arm-none-eabi-4.8-2014.04_linux.tar.xz --strip-components=1 -C /usr/local && \
    rm -rf ./gcc-linaro-arm-none-eabi-4.8-2014.04_linux.tar.xz

# COPY gcc-linaro-arm-none-eabi-4.8-2014.04_linux.tar.xz ./

RUN git config --global user.email "soulteary@gmail.com" && \
    git config --global user.name "soulteary" && \
    git config --global safe.directory '*'

WORKDIR /uboot