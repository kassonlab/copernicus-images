#!/bin/bash
export CPC_DATA=/oasis/scratch/comet/$USER/temp_project/cpc-data
export CPC_HOME=/home/$USER/copernicus
export PATH=$PATH:$CPC_HOME
module load gromacs
cpc-server setup $CPC_DATA

