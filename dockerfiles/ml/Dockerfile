ARG BASE_IMAGE=xundaoxd/base:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN if [ ! `cat /etc/passwd | grep xundaoxd` ]; then useradd -m -s /bin/bash xundaoxd; fi

RUN apt update \
    && apt install -y octave liboctave-dev \
    && rm -rf /var/lib/apt/lists/*

USER xundaoxd

RUN conda install -c conda-forge -y jupyterlab \
    && pip install ipywidgets \
    && pip cache purge \
    && conda clean -a -y

RUN pip install --upgrade "jax[cuda]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html \
    && pip cache purge

RUN conda install -y numba \
    && conda clean -a -y

ARG TVM_VERSION=0.9.0
RUN wget -O- https://dlcdn.apache.org/tvm/tvm-v${TVM_VERSION}/apache-tvm-src-v${TVM_VERSION}.tar.gz | tar -C /tmp -xvz \
    && cd /tmp/apache-tvm-src-v${TVM_VERSION} \
    && mkdir build && cp cmake/config.cmake build \
    && sed -i 's/set(USE_CUDA OFF)/set(USE_CUDA ON)/;s/set(USE_CUDNN OFF)/set(USE_CUDNN ON)/;s/set(USE_LLVM OFF)/set(USE_LLVM ON)/' build/config.cmake \
    && cmake -B build && cmake --build build -j 16 \
    && cd python && python setup.py install \
    && cd /tmp && rm -rf apache-tvm-src-v${TVM_VERSION}

RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113 \
    && pip cache purge \
    && conda clean -a -y

RUN pip install https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-2.8.0-cp37-cp37m-manylinux2010_x86_64.whl \
    && pip install --upgrade tensorflow_hub \
    && pip cache purge \
    && conda clean -a -y

RUN pip install megengine -f https://megengine.org.cn/whl/mge.html \
    && pip cache purge \
    && conda clean -a -y



RUN pip install onnxruntime-gpu tf2onnx skl2onnx \
    && pip cache purge
