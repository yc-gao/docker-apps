ARG BASE_IMAGE=nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /workdir

# basic setup
RUN apt update \
    && apt install -y software-properties-common apt-transport-https ca-certificates gnupg wget curl sudo \
    && add-apt-repository -y ppa:ubuntu-toolchain-r/test \
    && apt upgrade -y \
    && apt install -y build-essential g++-aarch64-linux-gnu \
    && bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)" \
    && update-alternatives --install /usr/bin/clang clang $(ls /usr/bin/clang-* | grep -E 'clang-[0-9]+') 50 \
    && update-alternatives --install /usr/bin/clang++ clang++ $(ls /usr/bin/clang++-* | grep -E 'clang\+\+-[0-9]+') 50 \
    && rm -rf /var/lib/apt/lists/*

# utils
RUN apt update \
    && add-apt-repository -y ppa:neovim-ppa/stable \
    && add-apt-repository -y ppa:git-core/ppa \
    && apt install -y neovim git gdb strace ltrace ninja-build ccache \
    && apt install -y unzip iproute2 socat netcat ffmpeg graphviz jq \
    && apt install -y libxkbfile-dev nsight-systems-2023.3.3 \
    && rm -rf /var/lib/apt/lists/*

# common libs
RUN apt update \
    && apt install -y libgoogle-glog-dev libgflags-dev libgtest-dev libboost-all-dev libgsl-dev libeigen3-dev libelf-dev libasio-dev libprotobuf-dev protobuf-compiler \
    && apt install -y xorg-dev libtinfo-dev \
    && rm -rf /var/lib/apt/lists/*

# install cmake
ARG CMAKE_VERSION=3.23.1
RUN sh -c "wget -qO - https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz | tar -C /opt -xz"
ENV PATH="/opt/cmake-${CMAKE_VERSION}-linux-x86_64/bin:${PATH}"

# install nodejs
ARG NODE_VERSION=18.15.0
RUN sh -c "wget -qO - https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz | tar -C /opt -xJ"
ENV PATH="/opt/node-v${NODE_VERSION}-linux-x64/bin:${PATH}"

# install go
ARG GO_VERSION=1.20.3
RUN sh -c "wget -qO - https://golang.google.cn/dl/go${GO_VERSION}.linux-amd64.tar.gz | tar -C /opt -xz"
ENV PATH="/opt/go/bin:${PATH}"

# install bazel
ARG BAZEL_VERSION=6.5.0
RUN wget -qO /usr/local/bin/bazel https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-linux-x86_64 \
    && chmod +x /usr/local/bin/bazel

# install miniconda3
ARG PYTHON_VERSION=3.8
ARG CONDA_PREFIX=/opt/miniconda3
RUN wget -qO Miniconda3.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && chmod +x Miniconda3.sh \
    && ./Miniconda3.sh -b -p ${CONDA_PREFIX} \
    && ${CONDA_PREFIX}/bin/conda install -y python=${PYTHON_VERSION} \
    && ${CONDA_PREFIX}/bin/conda clean -a -y \
    && rm -rf *
ENV PATH="${CONDA_PREFIX}/bin:${PATH}"

# create user: xundaoxd
RUN useradd -m -s /bin/bash xundaoxd \
    && echo '%xundaoxd ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && chown xundaoxd:xundaoxd -R ${CONDA_PREFIX}
USER xundaoxd

# common
RUN pip install cffi pytest build \
    && pip install jupyterlab \
    && pip install numpy matplotlib \
    && pip install seaborn pandas \
    && pip install scipy scikit-learn \
    && pip install opencv-python opencv-contrib-python Pillow \
    && pip install PyYAML protobuf \
    && pip install pybind11 Cython \
    && pip install meson \
    && pip install fire \
    && pip cache purge

# onnx
RUN pip install onnxruntime-gpu onnxruntime-tools onnxoptimizer skl2onnx onnx onnxscript \
    && pip cache purge

# pytorch
RUN pip install --index-url https://download.pytorch.org/whl/cu118 torch torchvision torchaudio torchdata torchtext \
    && pip cache purge

RUN pip install sentencepiece tiktoken \
    && pip cache purge

# tinygrad
# RUN pip install git+https://github.com/tinygrad/tinygrad.git \
#     && pip cache purge

