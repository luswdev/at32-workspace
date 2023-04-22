FROM ohmyzsh/ohmyzsh:main

RUN apt-get update
RUN apt-get install -y \
    curl \
    make \
    cmake \
    gcc \
    ccache \
    g++ \
    libssl-dev \
    bzip2

ARG TOOLCHAIN_PLAT=x86_64-linux
ARG TOOLCHAIN_VER=10.3-2021.10

RUN curl -Lo gcc-arm-none-eabi-$TOOLCHAIN_PLAT.tar.bz2 "https://developer.arm.com/-/media/Files/downloads/gnu-rm/$TOOLCHAIN_VER/gcc-arm-none-eabi-$TOOLCHAIN_VER-$TOOLCHAIN_PLAT.tar.bz2"

RUN mkdir /opt/gcc-arm-none-eabi-$TOOLCHAIN_PLAT
RUN tar xjfv gcc-arm-none-eabi-$TOOLCHAIN_PLAT.tar.bz2 -C /opt/gcc-arm-none-eabi-$TOOLCHAIN_PLAT --strip-components=1

RUN rm gcc-arm-none-eabi-$TOOLCHAIN_PLAT.tar.bz2

ARG CMAKE_VER=3.26.3

RUN curl -Lo cmake.tar.gz "https://github.com/Kitware/CMake/releases/download/v$CMAKE_VER/cmake-$CMAKE_VER.tar.gz"
RUN tar xzfv cmake.tar.gz

RUN cd cmake-$CMAKE_VER && cmake .
RUN cd cmake-$CMAKE_VER && make
RUN cd cmake-$CMAKE_VER && make install

RUN rm -rf cmake.tar.gz cmake-$CMAKE_VER

