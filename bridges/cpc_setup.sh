#!/bin/bash

export CPC_DATA=$HOME/cpc-data
export CPC_HOME=$HOME/copernicus
export PATH=$PATH:$CPC_HOME
export PYTHONPATH=$PYTHONPATH:$HOME
# module load hdf5
module load python2/2.7.11_gcc_np1.11
# kludge because we have gmx_mpi but no gmx on bridges
# module load gromacs
export PATH=$PATH:/home/kasson/bin

cpc-server setup $CPC_DATA
pushd `pwd`
cd $CPC_HOME
tar zxvf $CPC_HOME/examples/msm/msmbuilder-known-good.tar.gz
popd
