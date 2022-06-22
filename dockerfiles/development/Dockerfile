ARG BASE_IMAGE=xundaoxd/base:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

RUN if [ ! `cat /etc/passwd | grep xundaoxd` ]; then useradd -m -s /bin/bash xundaoxd; fi

RUN apt update \
    && apt install -y autoconf automake libtool clang-format ninja-build ccache flex bison bison-doc info man-db manpages manpages-dev \
    && apt install -y gdb strace ltrace \
    && apt install -y libgoogle-glog-dev libgflags-dev libgtest-dev libprotobuf-dev protobuf-compiler \
    && apt install -y linux-generic-hwe-20.04 \
    && apt install -y clang-format clang-tidy clang-tools clang clangd \
    libc++-dev libc++1 libc++abi-dev libc++abi1 libclang-dev libclang1 liblldb-dev libllvm-ocaml-dev libomp-dev libomp5 \
    lld lldb llvm-dev llvm-runtime llvm python3-clang \
    && rm -rf /var/lib/apt/lists/*

#install miniconda3
ARG CONDA_VERSION=py37_4.11.0
RUN wget -O /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh https://repo.anaconda.com/miniconda/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh \
    && chmod +x /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh \
    && /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh -b -p /opt/miniconda3 \
    && rm -rf /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh \
    && /opt/miniconda3/bin/conda update --all -y \
    && /opt/miniconda3/bin/conda install -y -c conda-forge ffmpeg \
    && /opt/miniconda3/bin/conda install -y \
    ipython \
    autopep8 pylint \
    numpy matplotlib pandas seaborn scipy scikit-learn python-graphviz \
    opencv \
    && /opt/miniconda3/bin/conda clean -a -y \
    && chown xundaoxd:xundaoxd -R /opt/miniconda3
ENV PATH="/opt/miniconda3/bin:${PATH}"

#install cmake
ARG CMAKE_VERSION=3.23.1
RUN sh -c "wget -qO - https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz | tar -C /opt -xzv"
ENV PATH="/opt/cmake-${CMAKE_VERSION}-linux-x86_64/bin:${PATH}"

# install go
RUN sh -c "wget -qO - https://golang.google.cn/dl/go1.17.6.linux-amd64.tar.gz | tar -C /opt -xzv"
ENV PATH="/opt/go/bin:${PATH}"

# install bazel
ARG BAZEL_VERSION=5.1.1
RUN wget -qO /usr/local/bin/bazel https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-linux-x86_64 \
    && chmod +x /usr/local/bin/bazel

USER xundaoxd
