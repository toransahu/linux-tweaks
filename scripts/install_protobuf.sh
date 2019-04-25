#! /bin/sh
#
# install_protobuf.sh
# Copyright (C) 2019 Toran Sahu <toran.sahu@yahoo.com>
#
# Distributed under terms of the MIT license.
#

# initial step
mkdir -p  ~/.temp
cd ~/.temp

# pre-requisites
sudo apt-get install autoconf automake libtool curl make g++ unzip

# from this link https://github.com/protocolbuffers/protobuf/releases/tag/v3.6.1 
# download protobuf-all-[VERSION].tar.gz
wget https://github.com/protocolbuffers/protobuf/releases/download/v3.6.1/protobuf-all-3.6.1.tar.gz

# extract
tar -xvzf protobuf-all-3.6.1.tar.gz

# change dir
cd protobuf-3.6.1/

# configure
./configure

# make
make
make check

# install 
sudo make install

# refresh shared library cache
sudo ldconfig

# validate
protoc --version
# ls /usr/local/include/google/protobuf/  # check lib files
