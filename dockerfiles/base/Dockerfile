ARG BASE_IMAGE=nvidia/cuda:11.6.2-cudnn8-devel-ubuntu20.04
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /workdir
USER root

RUN if ! grep xundaoxd /etc/passwd; then useradd -m -s /bin/bash xundaoxd; fi

RUN apt update \
    && apt install -y software-properties-common apt-transport-https wget curl gnupg ca-certificates \
    && apt install -y language-pack-en* language-pack-zh* language-pack-gnome-en* language-pack-gnome-zh* \
    && apt install -y fonts-firacode fonts-wqy-microhei ttf-wqy-zenhei fonts-arphic-ukai fonts-arphic-uming fonts-droid-fallback fonts-noto xfonts-base \
    && apt install -y libgtk2.0-0 libxshmfence-dev libnss3-dev libatk-bridge2.0-dev libdrm-dev libgtk-3-dev libasound2-dev libcanberra-gtk-module libcanberra-gtk3-module \
    && apt install -y yaru-theme-* \
    && apt install -y breeze \
    && rm -rf /var/lib/apt/lists/*

RUN apt update \
    && add-apt-repository -y ppa:neovim-ppa/stable \
    && add-apt-repository -y ppa:git-core/ppa \
    && apt install -y python3-pip python3-venv ffmpeg graphviz neovim git unzip firefox evince \
    && apt install -y build-essential clang lld autoconf automake libtool ninja-build ccache flex bison bison-doc info man-db manpages manpages-dev \
    && apt install -y gdb strace ltrace \
    && bash -c "$(wget -qO - https://apt.llvm.org/llvm.sh)" \
    && apt install -y libgoogle-glog-dev libgflags-dev libgtest-dev libprotobuf-dev protobuf-compiler libboost-all-dev libgsl-dev libopencv-dev libeigen3-dev \
    && rm -rf /var/lib/apt/lists/*

#install cmake
ARG CMAKE_VERSION=3.23.1
RUN sh -c "wget -qO - https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-x86_64.tar.gz | tar -C /opt -xzv"
ENV PATH="/opt/cmake-${CMAKE_VERSION}-linux-x86_64/bin:${PATH}"

# install go
RUN sh -c "wget -qO - https://golang.google.cn/dl/go1.17.6.linux-amd64.tar.gz | tar -C /opt -xzv"
ENV PATH="/opt/go/bin:${PATH}"

# install bazel
ARG BAZEL_VERSION=5.2.0
RUN wget -qO /usr/local/bin/bazel https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-linux-x86_64 \
    && chmod +x /usr/local/bin/bazel

#install miniconda3
ARG CONDA_VERSION=py38_23.1.0-1
RUN wget -qO /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh https://repo.anaconda.com/miniconda/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh \
    && chmod +x /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh \
    && /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh -b -p /opt/miniconda3 \
    && rm -rf /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh \
    && /opt/miniconda3/bin/conda install -y \
    jupyterlab ipywidgets ipython \
    pytest autopep8 pylint \
    numpy matplotlib pandas seaborn scipy scikit-learn pydot \
    protobuf=3.20 pillow pyyaml \
    pybind11 cython \
    && /opt/miniconda3/bin/conda install -y -c conda-forge xeus-cling \
    && /opt/miniconda3/bin/conda clean -a -y \
    && chown xundaoxd:xundaoxd -R /opt/miniconda3
ENV PATH="/opt/miniconda3/bin:${PATH}"

USER xundaoxd
