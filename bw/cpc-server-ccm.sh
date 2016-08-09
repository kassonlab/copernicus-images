#!/bin/bash
#PBS -N cpc_server
#PBS -l nodes=1:ppn=16:xe
#PBS -V
#PBS -l walltime=01:00:00
#PBS -l gres=ccm

module load bwpy
# module load gromacs
# kludge to use static pre-build gromacs binaries
export PATH=$PATH:/u/training/instr015/bin
export GMXLIB=/u/training/instr015/share/top

export CPC_DATA=$HOME/cpc-data
export CPC_HOME=$HOME/copernicus
export PATH=$PATH:$CPC_HOME
export PYTHONPATH=$PYTHONPATH:$HOME:$CPC_HOME

export PMI_NO_FORK=1
export PMI_NO_PREINITIALIZE=1

module load ccm
ccmrun cpc-server start -dev &
ccmrun ip addr show ipogif0 |egrep -v Application| tail -1 |awk '{print $2}' |awk -F / '{print $1}' > servername.txt
ccmrun cpc-server bundle -o local_bundle2.cnx
sleep 172800
# 48 hours
