#!/bin/bash

export CPC_DATA=$WORK/cpc-data
export CPC_HOME=$HOME/copernicus
export PATH=$PATH:$CPC_HOME
module load hdf5
module load python
module load gromacs

cpc-server setup $CPC_DATA

