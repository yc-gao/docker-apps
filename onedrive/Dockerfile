FROM ubuntu:20.04

RUN apt update \
    && apt install -y software-properties-common \
    && add-apt-repository -y ppa:yann1ck/onedrive \
    && apt install -y onedrive \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -m -s /bin/bash xundaoxd

USER xundaoxd

CMD ["onedrive", "-m"]
