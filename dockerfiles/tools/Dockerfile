ARG BASE_IMAGE=xundaoxd/development:latest
FROM ${BASE_IMAGE}

USER root

ARG DEBIAN_FRONTEND=noninteractive

ARG OBSIDIAN_VERSION=0.14.15
RUN apt update \
    && wget -O /tmp/obsidian_${OBSIDIAN_VERSION}_amd64.deb https://github.com/obsidianmd/obsidian-releases/releases/download/v${OBSIDIAN_VERSION}/obsidian_${OBSIDIAN_VERSION}_amd64.deb \
    && apt install -y /tmp/obsidian_${OBSIDIAN_VERSION}_amd64.deb \
    && rm -rf /tmp/obsidian_${OBSIDIAN_VERSION}_amd64.deb \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" \
    && apt install -y code ctags \
    && apt install -y doxygen gimp onedrive vlc python3-pip ffmpeg \
    && apt install -y poppler-utils \
    && pip3 install you-get tldr \
    && rm -rf /var/lib/apt/lists/*

RUN if [ ! `cat /etc/passwd | grep xundaoxd` ]; then useradd -m -s /bin/bash xundaoxd; fi

USER xundaoxd
