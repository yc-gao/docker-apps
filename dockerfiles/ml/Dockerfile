ARG BASE_IMAGE=nvidia/cuda:12.5.1-cudnn-devel-ubuntu20.04
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /workdir

# basic setup
RUN apt update \
    && apt install -y lsb-release software-properties-common sudo wget curl \
    && apt upgrade -y \
    && apt install -y build-essential cargo ninja-build ccache \
    && apt install -y neovim git gdb strace ltrace \
    && apt install -y iproute2 socat netcat \
    && apt install -y unzip ffmpeg graphviz jq aria2 \
    && rm -rf /var/lib/apt/lists/*

# common libs
RUN apt update \
    && apt install -y libgoogle-glog-dev libgflags-dev libgtest-dev \
    libboost-all-dev libasio-dev libeigen3-dev \
    libprotobuf-dev protobuf-compiler \
    libgsl-dev libelf-dev libxkbfile-dev libtinfo-dev libzstd-dev libedit-dev \
    && apt install -y xorg-dev \
    && rm -rf /var/lib/apt/lists/*

# install cmake
ARG CMAKE_VERSION=3.29.6
RUN sh -c "wget -qO - https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-$(uname -m).tar.gz | tar -C /opt -xz"
ENV PATH="/opt/cmake-${CMAKE_VERSION}-linux-x86_64/bin:${PATH}"

# install bazel
ARG BAZEL_VERSION=6.5.0
RUN wget -qO /usr/local/bin/bazel https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-linux-$(uname -m) \
    && chmod +x /usr/local/bin/bazel

# install nodejs
ARG NODE_VERSION=18.15.0
RUN sh -c "wget -qO - https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz | tar -C /opt -xJ"
ENV PATH="/opt/node-v${NODE_VERSION}-linux-x64/bin:${PATH}"

# install go
ARG GO_VERSION=1.20.3
RUN sh -c "wget -qO - https://golang.google.cn/dl/go${GO_VERSION}.linux-amd64.tar.gz | tar -C /opt -xz"
ENV PATH="/opt/go/bin:${PATH}"

# create user: ycgao
RUN useradd -m -s /bin/bash ycgao \
    && echo '%ycgao ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

# install miniconda3
ARG PYTHON_VERSION=38
ARG CONDA_VERSION=4.12.0
ARG CONDA_PREFIX=/opt/miniconda3
RUN wget -qO Miniconda3.sh https://repo.anaconda.com/miniconda/Miniconda3-py${PYTHON_VERSION}_${CONDA_VERSION}-Linux-$(uname -m).sh \
    && chmod +x Miniconda3.sh \
    && ./Miniconda3.sh -b -p ${CONDA_PREFIX} \
    && rm -rf * \
    && chown ycgao:ycgao -R ${CONDA_PREFIX}
ENV PATH="${CONDA_PREFIX}/bin:${PATH}"

USER ycgao

# common
RUN pip install cffi pytest build \
    && pip install pybind11 Cython \
    && pip install jupyterlab \
    && pip install numpy matplotlib seaborn pandas \
    && pip install scipy scikit-learn \
    && pip install opencv-python opencv-contrib-python \
    && pip install Pillow PyYAML protobuf \
    && pip install fire \
    && pip cache purge

# onnx
RUN pip install onnx onnxscript onnxconverter-common onnxruntime-gpu onnxruntime-tools onnxoptimizer skl2onnx \
    && pip cache purge

# pytorch
RUN pip install --index-url https://download.pytorch.org/whl/cu124 torch torchvision torchaudio torchdata torchtext \
    && pip cache purge

RUN pip install sentencepiece tiktoken immutabledict \
    && pip cache purge

