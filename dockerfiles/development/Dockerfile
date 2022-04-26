ARG BASE_IMAGE=xundaoxd/base-cuda:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

ARG CONDA_VERSION=py37_4.11.0
RUN wget -O /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh https://repo.anaconda.com/miniconda/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh \
    && chmod +x /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh \
    && /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh -b -p /opt/miniconda3 \
    && rm -rf /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh
ENV PATH="/opt/miniconda3/bin:${PATH}"

RUN wget -O /tmp/cmake-3.23.1-linux-x86_64.tar.gz https://github.com/Kitware/CMake/releases/download/v3.23.1/cmake-3.23.1-linux-x86_64.tar.gz \
    && tar -C /opt -xvf /tmp/cmake-3.23.1-linux-x86_64.tar.gz \
    && rm -rf /tmp/cmake-3.23.1-linux-x86_64.tar.gz
ENV PATH="/opt/cmake-3.23.1-linux-x86_64/bin:${PATH}"

RUN apt update \
    && apt install -y clang-format ninja-build ccache flex bison bison-doc info man-db manpages manpages-dev \
    libgflags-dev libgtest-dev \
    && (cd /usr/src/googletest \
    && cmake -B build \
    && cmake --build build \
    && cmake --install build \
    && rm -rf build) \
    && rm -rf /var/lib/apt/lists/*

RUN if [ ! `cat /etc/passwd | grep xundaoxd` ]; then useradd -m -s /bin/bash xundaoxd; fi \
    && chown xundaoxd -R /opt/miniconda3

USER xundaoxd
