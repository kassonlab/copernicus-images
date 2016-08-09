#!/bin/bash

# MODIFY THIS SECTION
export SERVER_PORT=13807
export CLIENT_PORT=14807

export CPC_DATA=$HOME/cpc-data
export CPC_HOME=$HOME/copernicus
export PATH=$PATH:$CPC_HOME
export PYTHONPATH=$PYTHONPATH:$HOME:$CPC_HOME
module load python2/2.7.11_gcc_np1.11
module load hdf5
# kludge because we have gmx_mpi but no gmx on bridges
# module load gromacs
export PATH=$PATH:/home/kasson/bin

# install pytables for tutorial 4
pip install --target=$HOME/copernicus tables
# use system numpy instead
rm -r $CPC_HOME/numpy

# install msmbuilder for tutorial 4
cpc-server setup $CPC_DATA
cpc-server config server_secure_port $SERVER_PORT
cpc-server config client_secure_port $CLIENT_PORT

pushd `pwd`
cd $CPC_HOME
tar zxvf $CPC_HOME/examples/msm/msmbuilder-known-good.tar.gz
popd
