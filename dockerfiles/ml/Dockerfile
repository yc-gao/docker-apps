ARG BASE_IMAGE=xundaoxd/base-cuda:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive
ARG VERSION=py37_4.11.0

RUN wget -O /tmp/Miniconda3-${VERSION}-Linux-x86_64.sh https://repo.anaconda.com/miniconda/Miniconda3-${VERSION}-Linux-x86_64.sh \
    && chmod +x /tmp/Miniconda3-${VERSION}-Linux-x86_64.sh \
    && /tmp/Miniconda3-${VERSION}-Linux-x86_64.sh -b -p /opt/miniconda3 \
    && rm -rf /tmp/Miniconda3-${VERSION}-Linux-x86_64.sh \
    && useradd -m -s /bin/bash xundaoxd \
    && chown xundaoxd -R /opt/miniconda3

USER xundaoxd

ENV PATH="/opt/miniconda3/bin:${PATH}"

RUN conda install -y ipython \
    && conda install -y -c conda-forge -c pytorch numpy matplotlib pandas seaborn scipy scikit-learn \
    cudatoolkit=11.4 \
    pytorch torchvision torchaudio \
    tensorflow-gpu \
    && python3 -m pip install --find-links https://release.oneflow.info oneflow==0.7.0+cu112 \
    && conda clean -a -y
