#!/bin/bash
#PBS -N cpc_server
#PBS -o "cpc_server.%j.%N.out"
#PBS -e "cpc_server.%j.%N.err"
#PBS -l nodes=1:ppn=16:xe
#PBS -V
#PBS -l walltime=02:00:00

module load bwpy
# module load gromacs
# kludge to use static pre-build gromacs binaries
export PATH=$PATH:/u/training/instr015/bin

export CPC_DATA=$HOME/cpc-data
export CPC_HOME=$HOME/copernicus
export PATH=$PATH:$CPC_HOME
aprun cpc-server start
cpc-server bundle -o local_bundle.cnx
sleep 172800
# 48 hours
