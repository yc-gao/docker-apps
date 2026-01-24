ARG BASE_IMAGE=nvcr.io/nvidia/cuda:12.5.1-cudnn-devel-ubuntu20.04
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive
WORKDIR /workdir

RUN apt update \
    && apt upgrade -y \
    && apt install -y \
    sudo gnupg2 ca-certificates \
    curl wget unzip xz-utils \
    && rm -rf /var/lib/apt/lists/*

RUN apt update \
    && apt install -y \
    build-essential crossbuild-essential-amd64 ninja-build \
    clang clangd clang-format clang-tools libclang-dev llvm-dev \
    cargo \
    git gdb strace ltrace ccache \
    iproute2 socat netcat jq aria2 ffmpeg graphviz \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

# cuda tools
RUN apt update \
    && apt install -y \
    nsight-compute-2025.2.1 nsight-systems-2025.1.3 nsight-dl \
    libnvinfer-dev libnvonnxparsers-dev libnvinfer-bin \
    && rm -rf /var/lib/apt/lists/* \
    && echo "export PATH=\"/usr/local/cuda/bin:\${PATH}\"" >>/etc/profile.d/docker_env.sh

# common libs
RUN apt update \
    && apt install -y \
    libgoogle-glog-dev libgflags-dev libgtest-dev \
    libboost-all-dev libasio-dev libeigen3-dev \
    libprotobuf-dev protobuf-compiler \
    libgsl-dev libelf-dev libxkbfile-dev libtinfo-dev libzstd-dev libedit-dev xorg-dev \
    && rm -rf /var/lib/apt/lists/*

# install cmake
ARG CMAKE_VERSION=4.0.3
RUN wget -qO - "https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz" | tar -C /opt -xz \
    && echo "export PATH=\"/opt/cmake-${CMAKE_VERSION}-linux-x86_64/bin:\${PATH}\"" >>/etc/profile.d/docker_env.sh

# install bazel
ARG BAZEL_VERSION=7.3.1
RUN wget -qO /usr/local/bin/bazel "https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-linux-x86_64" \
    && chmod +x /usr/local/bin/bazel

# install nodejs
ARG NODE_VERSION=v20.18.0
RUN wget -qO - "https://nodejs.org/dist/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64.tar.xz" | tar -C /opt -xJ \
    && echo "export PATH=\"/opt/node-${NODE_VERSION}-linux-x64/bin:\${PATH}\"" >>/etc/profile.d/docker_env.sh

# install go
ARG GO_VERSION=1.23.4
RUN sh -c "wget -qO - https://golang.google.cn/dl/go${GO_VERSION}.linux-amd64.tar.gz | tar -C /opt -xz" \
    && echo "export PATH=\"/opt/go/bin:\${PATH}\"" >>/etc/profile.d/docker_env.sh

# install miniconda3
ARG PYTHON_VERSION=310
ARG CONDA_VERSION=4.12.0
ARG CONDA_PREFIX=/opt/miniconda3
RUN wget -qO Miniconda3.sh https://repo.anaconda.com/miniconda/Miniconda3-py${PYTHON_VERSION}_${CONDA_VERSION}-Linux-x86_64.sh \
    && chmod +x Miniconda3.sh \
    && ./Miniconda3.sh -b -p ${CONDA_PREFIX} \
    && rm -rf * \
    && echo "export PATH=\"${CONDA_PREFIX}/bin:\${PATH}\"" >>/etc/profile.d/docker_env.sh

# common
RUN /opt/miniconda3/bin/python3 -m pip install \
    cffi pytest build pybind11 cython \
    immutabledict \
    ipython jupyterlab fire \
    numpy matplotlib seaborn pandas scipy scikit-learn \
    opencv-python opencv-contrib-python \
    Pillow PyYAML protobuf \
    && /opt/miniconda3/bin/python3 -m pip cache purge

# tensorrt
RUN /opt/miniconda3/bin/python3 -m pip install tensorrt \
    && /opt/miniconda3/bin/python3 -m pip cache purge

# onnx
RUN /opt/miniconda3/bin/python3 -m pip install \
    onnx onnxscript onnxconverter-common onnxoptimizer onnxsim skl2onnx \
    onnxruntime-gpu onnxruntime-extensions onnxruntime-tools \
    && /opt/miniconda3/bin/python3 -m pip cache purge

# pytorch
RUN /opt/miniconda3/bin/python3 -m pip install --index-url https://download.pytorch.org/whl/cu121 torch torchvision \
    && /opt/miniconda3/bin/python3 -m pip cache purge

RUN /opt/miniconda3/bin/python3 -m pip install \
    sentencepiece tiktoken \
    streamlit \
    && /opt/miniconda3/bin/python3 -m pip cache purge

# start sshd server: /usr/sbin/sshd -D -p 8022
ARG SSHD_PASSWD=demo.123
ARG SSHD_PORT=8022
RUN sed \
        -e "/PermitRootLogin/a PermitRootLogin yes" \
        -e "/Port/a Port ${SSHD_PORT}" \
        -i /etc/ssh/sshd_config \
    && mkdir -p /run/sshd \
    && echo "root:${SSHD_PASSWD}" | chpasswd
