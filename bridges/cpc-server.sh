#!/bin/bash
#SBATCH --job-name="cpc_server"
#SBATCH --output="cpc_server.%j.%N.out"
#SBATCH -p RM
#SBATCH -N 1
#SBATCH --export=ALL
#SBATCH -t 2:00:00

# kludge because we have gmx_mpi but no gmx on bridges
# module load gromacs
export PATH=$PATH:/home/kasson/bin
module load anaconda
# module load hdf5

export CPC_DATA=$HOME/cpc-data
export CPC_HOME=$HOME/copernicus
export PATH=$PATH:$CPC_HOME
export PYTHONPATH=$PYTHONPATH:$CPC_HOME
cpc-server start
cpc-server bundle -o local_bundle.cnx
sleep 172800  # 48 hours
