ARG BASE_IMAGE=nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /workdir

# basic setup
RUN apt update \
    && apt install -y software-properties-common apt-transport-https ca-certificates gnupg wget curl \
    && apt install -y cuda-11-8 build-essential \
    && bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)" \
    && rm -rf /var/lib/apt/lists/*

# utils
RUN apt update \
    && add-apt-repository -y ppa:neovim-ppa/stable \
    && add-apt-repository -y ppa:git-core/ppa \
    && apt install -y neovim git gdb strace ltrace ninja-build ccache \
    && apt install -y unzip iproute2 socat graphviz \
    && rm -rf /var/lib/apt/lists/*

# common libs
RUN apt update \
    && apt install -y libgoogle-glog-dev libgflags-dev libgtest-dev libboost-all-dev libgsl-dev libeigen3-dev libelf-dev \
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
ARG BAZEL_VERSION=5.2.0
RUN wget -qO /usr/local/bin/bazel https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-linux-x86_64 \
    && chmod +x /usr/local/bin/bazel

# octave
RUN apt update \
    && apt install -y octave \
    && rm -rf /var/lib/apt/lists/*

# install miniconda3
ARG PYTHON_VERSION=3.8
ARG CONDA_PREFIX=/opt/miniconda3
RUN wget -qO /tmp/Miniconda3.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && chmod +x /tmp/Miniconda3.sh \
    && /tmp/Miniconda3.sh -b -p ${CONDA_PREFIX} \
    && ${CONDA_PREFIX}/bin/conda install -y python=${PYTHON_VERSION} \
    && ${CONDA_PREFIX}/bin/pip install ipython jupyterlab ipywidgets \
        numpy pandas Pillow matplotlib scipy scikit-learn opencv-python opencv-contrib-python \
        PyYAML protobuf \
        pybind11 Cython \
    && ${CONDA_PREFIX}/bin/conda clean -a -y \
    && ${CONDA_PREFIX}/bin/pip cache purge \
    && rm -rf *
ENV PATH="${CONDA_PREFIX}/bin:${PATH}"

# create user: xundaoxd
RUN apt update \
    && apt install -y sudo \
    && rm -rf /var/lib/apt/lists/* \
    && if ! grep xundaoxd /etc/passwd; then useradd -m -s /bin/bash xundaoxd; fi \
    && echo '%xundaoxd ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers \
    && chown xundaoxd:xundaoxd -R ${CONDA_PREFIX}
USER xundaoxd

# onnx
RUN pip install onnxruntime-gpu onnxruntime-tools onnxoptimizer skl2onnx \
    && pip cache purge

# pytorch
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 \
    && pip cache purge

# tensorflow
RUN pip install tensorflow \
    && pip cache purge

# tensort
RUN pip install --upgrade tensorrt \
    && pip cache purge

# mediapipe
RUN pip install mediapipe \
    && pip cache purge

# Hugging face
RUN pip install datasets tokenizers timm gradio 'diffusers[torch]' 'transformers[torch]' \
    && pip cache purge

