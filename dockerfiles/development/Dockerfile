ARG BASE_IMAGE=xundaoxd/base-cuda:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

ARG CONDA_VERSION=py37_4.11.0
RUN wget -O /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh https://repo.anaconda.com/miniconda/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh \
    && chmod +x /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh \
    && /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh -b -p /opt/miniconda3 \
    && rm -rf /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh
ENV PATH="/opt/miniconda3/bin:${PATH}"

RUN conda install -c conda-forge -y cmake bazel buildifier autopep8 pylint \
    && conda clean -a -y

RUN apt update \
    && apt install -y clang-format ninja-build flex bison bison-doc info man-db manpages manpages-dev \
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
