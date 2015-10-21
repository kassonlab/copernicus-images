#!/bin/bash
#SBATCH --job-name="cpc_server"
#SBATCH --output="cpc_server.%j.%N.out"
#SBATCH --partition=normal
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --export=ALL
#SBATCH -t 48:00:00

module load gromacs

export CPC_DATA=$WORK/cpc-data
export CPC_HOME=$HOME/copernicus
export PATH=$PATH:$CPC_HOME
module load gromacs
module load hdf5
module load python
cpc-server start
cpc-server bundle -o local_bundle.cnx
sleep 172800  # 48 hours
