FROM ubuntu:16.04

ADD VERSION .

RUN apt update && apt install git -y && \
git clone https://github.com/glossom-dev/glossom-public-base-os.git /tmp/glossom-public-base-os && \
cd /tmp/glossom-public-base-os && ./init_16.04.sh
