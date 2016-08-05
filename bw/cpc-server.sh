#!/bin/bash
#PBS -N cpc_server
#PBS -o "cpc_server.%j.%N.out"
#PBS -e "cpc_server.%j.%N.err"
#PBS -l nodes=1:ppn=16:xe
#PBS -V
#PBS -l walltime=02:00:00

module load gromacs
module load bwpy

export CPC_DATA=$HOME/cpc-data
export CPC_HOME=$HOME/copernicus
export PATH=$PATH:$CPC_HOME
cpc-server start
cpc-server bundle -o local_bundle.cnx
sleep 172800  # 48 hours
