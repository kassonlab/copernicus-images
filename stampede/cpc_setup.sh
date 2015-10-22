#!/bin/bash

export CPC_DATA=$WORK/cpc-data
export CPC_HOME=$HOME/copernicus
export PATH=$PATH:$CPC_HOME
export PYTHONPATH=$PYTHONPATH:$HOME
module load hdf5
module load python
module load gromacs

cpc-server setup $CPC_DATA
tar zxvf $CPC_HOME/examples/msm/msmbuilder-known-good.tar.gz
