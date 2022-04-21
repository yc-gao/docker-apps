ARG BASE_IMAGE=xundaoxd/development:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

RUN conda install -y ipython \
    numpy matplotlib pandas seaborn scipy scikit-learn \
    && conda install -y pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch \
    && conda clean -a -y

RUN pip install https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-2.8.0-cp37-cp37m-manylinux2010_x86_64.whl \
    && pip install --upgrade tensorflow_hub \
    && pip cache purge

RUN pip install onnxruntime-gpu==1.10 \
    && pip cache purge
