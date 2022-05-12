ARG BASE_IMAGE=xundaoxd/development:latest
FROM ${BASE_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" \
    && apt install -y code ctags \
    && rm -rf /var/lib/apt/lists/*

USER xundaoxd
