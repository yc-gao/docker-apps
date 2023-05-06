ARG BASE_IMAGE=xundaoxd/base:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

RUN conda install -y \
        ipywidgets jupyterlab ipython \
        numpy matplotlib pandas seaborn scipy scikit-learn \
        pyyaml pillow protobuf \
        pybind11 cython \
    && conda clean -a -y

# onnx
RUN pip install onnxruntime-gpu onnxruntime-tools skl2onnx \
    && pip cache purge

# pytorch
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 \
    && pip cache purge

# tensorflow
RUN pip install tensorflow \
    && pip cache purge

# Hugging face
RUN pip install datasets tokenizers timm gradio 'diffusers[torch]' 'transformers[torch]' \
    && pip cache purge

