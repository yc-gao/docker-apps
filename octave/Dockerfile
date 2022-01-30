FROM xundaoxd/base:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt install -y octave \
    && useradd -m -s /bin/bash xundaoxd \
    && rm -rf /var/lib/apt/lists/*

USER xundaoxd
