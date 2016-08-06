#!/bin/bash
#PBS -N cpc_server
#PBS -l nodes=1:ppn=16:xe
#PBS -V
#PBS -l walltime=02:00:00

module load bwpy
# module load gromacs
# kludge to use static pre-build gromacs binaries
export PATH=$PATH:/u/training/instr015/bin
export GMXLIB=/u/training/instr015/share/top

export CPC_DATA=$HOME/cpc-data
export CPC_HOME=$HOME/copernicus
export PATH=$PATH:$CPC_HOME
export PYTHONPATH=$PYTHONPATH:$HOME:$CPC_HOME
aprun hostname
cpc-server start
cpc-server bundle -o local_bundle2.cnx
sleep 172800
# 48 hours
