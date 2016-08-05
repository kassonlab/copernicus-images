#!/bin/bash

export CPC_DATA=$HOME/cpc-data
export CPC_HOME=$HOME/copernicus
export PATH=$PATH:$CPC_HOME
export PYTHONPATH=$PYTHONPATH:$HOME
module load bwpy  # Blue Waters python packages
# module load gromacs

cpc-server setup $CPC_DATA
tar zxvf $CPC_HOME/examples/msm/msmbuilder-known-good.tar.gz
