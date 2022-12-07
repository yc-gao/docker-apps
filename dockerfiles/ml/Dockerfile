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

RUN conda install --yes pytorch torchvision torchaudio pytorch-cuda=11.6 -c pytorch -c nvidia \
    && pip install -f https://llvm.github.io/torch-mlir/package-index/ torch-mlir \
    && pip install git+https://github.com/iree-org/iree-torch.git \
    && pip cache purge \
    && conda clean -a -y

RUN pip install https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-2.8.0-cp37-cp37m-manylinux2010_x86_64.whl \
    && pip install --upgrade tensorflow-hub \
    && pip cache purge \
    && conda clean -a -y

RUN pip install onnxruntime-gpu tf2onnx skl2onnx \
    && pip cache purge

