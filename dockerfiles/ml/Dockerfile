ARG BASE_IMAGE=nvcr.io/nvidia/cuda:12.5.1-cudnn-devel-ubuntu20.04
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /workdir

RUN apt update \
    && apt upgrade -y \
    && apt install -y \
    sudo gnupg2 ca-certificates \
    curl wget unzip \
    && rm -rf /var/lib/apt/lists/*

RUN apt update \
    && apt install -y \
    build-essential crossbuild-essential-amd64 ninja-build \
    clang clangd clang-format clang-tools libclang-dev llvm-dev \
    cargo \
    git gdb strace ltrace ccache \
    iproute2 socat netcat jq aria2 ffmpeg graphviz \
    && rm -rf /var/lib/apt/lists/*

# common libs
RUN apt update \
    && apt install -y \
    libgoogle-glog-dev libgflags-dev libgtest-dev \
    libboost-all-dev libasio-dev libeigen3-dev \
    libprotobuf-dev protobuf-compiler \
    libgsl-dev libelf-dev libxkbfile-dev libtinfo-dev libzstd-dev libedit-dev xorg-dev \
    && rm -rf /var/lib/apt/lists/*

# install cmake
ARG CMAKE_VERSION=3.29.6
RUN wget -qO - "https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz" | tar -C /opt -xz
ENV PATH="/opt/cmake-${CMAKE_VERSION}-linux-x86_64/bin:${PATH}"

# install bazel
ARG BAZEL_VERSION=7.3.1
RUN wget -qO /usr/local/bin/bazel "https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-linux-x86_64" \
    && chmod +x /usr/local/bin/bazel

# install nodejs
ARG NODE_VERSION=v20.18.0
RUN wget -qO - "https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz" | tar -C /opt -xJ
ENV PATH="/opt/node-${NODE_VERSION}-linux-x64/bin:${PATH}"

# install go
ARG GO_VERSION=1.23.4
RUN sh -c "wget -qO - https://golang.google.cn/dl/go${GO_VERSION}.linux-amd64.tar.gz | tar -C /opt -xz"
ENV PATH="/opt/go/bin:${PATH}"

# install miniconda3
ARG PYTHON_VERSION=310
ARG CONDA_VERSION=4.12.0
ARG CONDA_PREFIX=/opt/miniconda3
RUN wget -qO Miniconda3.sh https://repo.anaconda.com/miniconda/Miniconda3-py${PYTHON_VERSION}_${CONDA_VERSION}-Linux-x86_64.sh \
    && chmod +x Miniconda3.sh \
    && ./Miniconda3.sh -b -p ${CONDA_PREFIX} \
    && rm -rf *
ENV PATH="${CONDA_PREFIX}/bin:${PATH}"

# common
RUN python3 -m pip install \
    cffi pytest build pybind11 Cython \
    ipython jupyterlab fire \
    numpy matplotlib seaborn pandas scipy scikit-learn \
    opencv-python opencv-contrib-python \
    Pillow PyYAML protobuf \
    && python3 -m pip cache purge

# onnx
RUN python3 -m pip install \
    onnx onnxscript onnxconverter-common onnxruntime-gpu onnxruntime-tools onnxoptimizer onnxsim skl2onnx \
    && python3 -m pip cache purge

# pytorch
RUN python3 -m pip install --index-url https://download.pytorch.org/whl/cu121 torch torchvision \
    && python3 -m pip cache purge

RUN python3 -m pip install sentencepiece tiktoken immutabledict \
    && python3 -m pip cache purge
