FROM ubuntu

ARG USER="unsunghero"
ARG EMAIL="unsunghero@thisadress.does.not.exist.com"

RUN apt-get update &&\
apt-get -y install git &&\
mkdir /root/.ssh


RUN git config --global user.name $USER &&\
git config --global user.email $EMAIL 

RUN apt-get install -y vim

