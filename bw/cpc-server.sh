#!/bin/bash
#PBS -N cpc_server
#PBS -l nodes=1:ppn=16:xe
#PBS -V
#PBS -l walltime=06:00:00
#PBS -l gres=ccm

module load bwpy
# module load gromacs
# kludge to use static pre-build gromacs binaries
export PATH=$PATH:/u/training/instr010/bin
export GMXLIB=/u/training/instr010/share/top

export CPC_DATA=$HOME/cpc-data
export CPC_HOME=$HOME/copernicus
export PATH=$PATH:$CPC_HOME
export PYTHONPATH=$PYTHONPATH:$HOME:$CPC_HOME

export PMI_NO_FORK=1
export PMI_NO_PREINITIALIZE=1

module load ccm
module load bwpy
ccmrun cpc-server bundle -o local_bundle2.cnx
ccmrun copernicus-images/bw/srv-wrapper.sh &
ccmrun ip addr show ipogif0 |egrep -v Application| tail -1 |awk '{print $2}' |awk -F / '{print $1}' > servername.txt
ccmrun ip addr show ipogif0
sleep 172800
# 48 hours
