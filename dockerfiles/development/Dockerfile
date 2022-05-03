ARG BASE_IMAGE=xundaoxd/base-cuda:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y clang-format ninja-build ccache flex bison bison-doc info man-db manpages manpages-dev \
    && apt install -y gdb strace ltrace \
    && apt install -y libgflags-dev libgtest-dev \
    && rm -rf /var/lib/apt/lists/*

ARG CONDA_VERSION=py37_4.11.0
RUN wget -O /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh https://repo.anaconda.com/miniconda/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh \
    && chmod +x /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh \
    && /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh -b -p /opt/miniconda3 \
    && rm -rf /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh \
    && /opt/miniconda3/bin/conda update --all -y \
    && /opt/miniconda3/bin/conda install -y \
        ipython \
        autopep8 pylint \
        numpy matplotlib pandas seaborn scipy scikit-learn \
        opencv \
    && conda clean -a -y
ENV PATH="/opt/miniconda3/bin:${PATH}"

ARG CMAKE_VERSION=3.23.1
RUN wget -O /tmp/cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz \
    && tar -C /opt -xvf /tmp/cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz \
    && rm -rf /tmp/cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz
ENV PATH="/opt/cmake-${CMAKE_VERSION}-linux-x86_64/bin:${PATH}"

RUN if [ ! `cat /etc/passwd | grep xundaoxd` ]; then useradd -m -s /bin/bash xundaoxd; fi \
    && chown xundaoxd -R /opt/miniconda3

USER xundaoxd
