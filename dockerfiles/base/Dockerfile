ARG BASE_IMAGE=nvidia/cuda:11.4.2-cudnn8-devel-ubuntu20.04
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN if [ ! `cat /etc/passwd | grep xundaoxd` ]; then useradd -m -s /bin/bash xundaoxd; fi

RUN apt update \
    && apt install -y apt-transport-https curl gnupg \
    && apt install -y software-properties-common xdg-utils ca-certificates \
    && apt install -y language-pack-en* language-pack-zh* language-pack-gnome-en* language-pack-gnome-zh* \
    && apt install -y fonts-firacode fonts-wqy-microhei ttf-wqy-zenhei fonts-arphic-ukai fonts-arphic-uming fonts-droid-fallback fonts-noto xfonts-base \
    && apt install -y libgtk2.0-0 libxshmfence-dev libnss3-dev libatk-bridge2.0-dev libdrm-dev libgtk-3-dev libasound2-dev libcanberra-gtk-module libcanberra-gtk3-module \
    && apt install -y yaru-theme-* \
    && apt install -y python3-pip ffmpeg graphviz neovim git ninja-build ccache unzip \
    && apt install -y wget firefox evince \
    && rm -rf /var/lib/apt/lists/*

RUN apt update \
    && apt install -y autoconf automake libtool clang-format ninja-build ccache flex bison bison-doc info man-db manpages manpages-dev \
    && apt install -y clang \
    && apt install -y gdb strace ltrace bc \
    && apt install -y libgoogle-glog-dev libgflags-dev libgtest-dev libprotobuf-dev protobuf-compiler libboost-all-dev libgsl-dev \
    && apt install -y libelf-dev libssl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

#install miniconda3
ARG CONDA_VERSION=py37_4.11.0
RUN wget -O /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh https://repo.anaconda.com/miniconda/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh \
    && chmod +x /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh \
    && /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh -b -p /opt/miniconda3 \
    && rm -rf /tmp/Miniconda3-${CONDA_VERSION}-Linux-x86_64.sh \
    && /opt/miniconda3/bin/conda update --all -y \
    && /opt/miniconda3/bin/conda install -y -c conda-forge ffmpeg \
    && /opt/miniconda3/bin/conda install -y -c conda-forge pybind11 \
    && /opt/miniconda3/bin/conda install -y \
    ipython \
    autopep8 pylint \
    cython \
    pytest \
    numpy matplotlib pandas seaborn scipy scikit-learn python-graphviz pydot \
    opencv=4.0 \
    protobuf=3.20 \
    pillow=6.2 \
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
ARG BAZEL_VERSION=5.2.0
RUN wget -qO /usr/local/bin/bazel https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-linux-x86_64 \
    && chmod +x /usr/local/bin/bazel

USER xundaoxd
