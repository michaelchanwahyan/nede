# Dockerfile for building general development
# environment for nvidia-required applications
FROM nvidia/cuda:10.0-base
LABEL maintainer "michaelchanwahyan@yahoo.com.hk"

RUN apt-get -y update ;\
    apt-get -y install screen apt-utils cmake htop wget vim nano curl git \
               software-properties-common apt-transport-https net-tools \
               bc npm ca-certificates musl-dev gcc make g++ gfortran

#RUN wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz ;\
#    tar -zxvf Python-3.6.8.tgz ;\
#    cd Python-3.6.8 ;\
#    ./configure ;\
#    make -j8

RUN apt-get -y install python3-pip ;\
    pip3 install --upgrade pip

COPY [ "requirements.txt" , "/" ]

RUN pip3 install -r requirements.txt

RUN jupyter nbextension enable --py widgetsnbextension ;\
    jupyter serverextension enable --py jupyterlab

RUN pip3 install git+https://github.com/IcarusSO/nbparameterise.git

COPY [ ".bashrc" , ".vimrc" , "/root/" ]

EXPOSE 9090 9999

CMD [ "/bin/bash" ]
