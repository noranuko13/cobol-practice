FROM ubuntu:18.04

RUN apt-get -y update
RUN apt-get install -y vim tree wget open-cobol && \
    apt-get clean all
