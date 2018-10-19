FROM ubuntu:latest
MAINTAINER Ajayi Olabode (boraton2010@gmail.com)
RUN apt-get update && apt-get install -y wget bash git sudo make gzip openssl python python-dev g++ default-jdk
# Use "bash" as replacement for	"sh"
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN mkdir -p /usr/local/SDK/
RUN wget -O /tmp/dx-toolkit-v0.255.0-ubuntu-14.04-amd64.tar.gz https://wiki.dnanexus.com/images/files/dx-toolkit-v0.255.0-ubuntu-14.04-amd64.tar.gz && \
    gunzip /tmp/dx-toolkit-v0.255.0-ubuntu-14.04-amd64.tar.gz && \
    tar -xvf /tmp/dx-toolkit-v0.255.0-ubuntu-14.04-amd64.tar -C /usr/local/SDK/ && \
    cd /usr/local/SDK/dx-toolkit/ && \
    /bin/bash -c "source /usr/local/SDK/dx-toolkit/environment" 
# RUN source /dx-toolkit/environment
ENV PATH /dx-toolkit/bin:$PATH

# Upload Agent
RUN mkdir -p /usr/local/upload/
RUN wget -O /tmp/dnanexus-upload-agent-1.5.30-linux.tar.gz https://wiki.dnanexus.com/images/files/dnanexus-upload-agent-1.5.30-linux.tar.gz && \
    gunzip /tmp/dnanexus-upload-agent-1.5.30-linux.tar.gz && \
    tar -xvf /tmp/dnanexus-upload-agent-1.5.30-linux.tar -C /usr/local/upload/ && \
    cd /usr/local/upload/dnanexus-upload-agent-1.5.30-linux/ && \
    chmod +x ua && \
    cp -v /usr/local/upload/dnanexus-upload-agent-1.5.30-linux/ua /usr/local/bin/ 
    #ln -s /usr/local/upload/dnanexus-upload-agent-1.5.30-linux/ua /usr/local/bin/ua
#ENV PATH /dnanexus-upload-agent-1.5.30-linux:$PATH
RUN rm -rf /tmp/*
