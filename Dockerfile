FROM ubuntu:14.04

RUN apt-get update && \
apt-get install -y wget vim git tcl && \
apt-get install -y swig python-dev python-numpy python-scipy python-matplotlib python-pandas python-sklearn python-h5py && \
apt-get install -y python3-dev python3-numpy python3-scipy python3-matplotlib python3-pandas python3-h5py

RUN apt-get install -y guile-2.0-dev autoconf zlib1g pkg-config && \
apt-get install -y libgsl0ldbl harminv fftw-dev && \
apt-get install -y openmpi-bin openmpi-doc libopenmpi-dev libhdf5-openmpi-dev && \
cd /home && git clone https://github.com/FilipDominec/python-meep-install.git && cd python-meep-install && ./python-meep-install.sh && cd .. && rm -rf python-meep-install

RUN apt-get install -y libhdf5-mpich2-dev && \
apt-get install -y libhdf5-openmpi-dev

RUN mkdir /home/hostSRC
VOLUME /home/hostSRC

RUN apt-get -y update && \
    apt-get -y install curl && \
    curl -H 'Cache-Control: no-cache' \
        https://raw.githubusercontent.com/nimbix/image-common/master/install-nimbix.sh \
        | bash -s -- --setup-nimbix-desktop

# Expose port 22 for local JARVICE emulation in docker
EXPOSE 22

# for standalone use
EXPOSE 5901
EXPOSE 443
