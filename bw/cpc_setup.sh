#!/bin/bash

# MODIFY THIS SECTION IF RUNNING ON SHARED NODES
export SERVER_PORT=13807
export CLIENT_PORT=14807

export CPC_DATA=$HOME/cpc-data
export CPC_HOME=$HOME/copernicus
export PATH=$PATH:$CPC_HOME
export PYTHONPATH=$PYTHONPATH:$HOME
module load bwpy  # Blue Waters python packages
# module load gromacs
# no BW modules for gromacs
# instead kludge:
export PATH=$PATH:/u/training/instr015/bin

cpc-server setup $CPC_DATA
pushd `pwd`
cd $CPC_HOME
tar zxvf $CPC_HOME/examples/msm/msmbuilder-known-good.tar.gz
popd
