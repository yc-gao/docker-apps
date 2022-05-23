ARG BASE_IMAGE=xundaoxd/development:latest
FROM ${BASE_IMAGE}

USER root

ARG DEBIAN_FRONTEND=noninteractive

RUN conda install -y pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch \
    && conda install -y pillow=6.2 \
    && pip install --pre torch-mlir -f https://github.com/llvm/torch-mlir/releases \
    && conda clean -a -y

RUN pip install https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-2.8.0-cp37-cp37m-manylinux2010_x86_64.whl \
    && pip install --upgrade tensorflow_hub \
    && pip cache purge

RUN pip install paddlepaddle-gpu==2.2.2.post112 -f https://www.paddlepaddle.org.cn/whl/linux/mkl/avx/stable.html \
    && pip cache purge

RUN pip install onnxruntime-gpu==1.10 \
    && pip cache purge

RUN apt update \
    && apt install -y octave \
    && rm -rf /var/lib/apt/lists/*

RUN if [ ! `cat /etc/passwd | grep xundaoxd` ]; then useradd -m -s /bin/bash xundaoxd; fi

USER xundaoxd

