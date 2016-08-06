#!/bin/bash

export CPC_DATA=$HOME/cpc-data
export CPC_HOME=$HOME/copernicus
export PATH=$PATH:$CPC_HOME
export PYTHONPATH=$PYTHONPATH:$HOME
# module load hdf5
module load python2/2.7.11_gcc_np1.11
module load gromacs

cpc-server setup $CPC_DATA
tar zxvf $CPC_HOME/examples/msm/msmbuilder-known-good.tar.gz
