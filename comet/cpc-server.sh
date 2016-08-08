#!/bin/bash
#SBATCH --job-name="cpc_server"
#SBATCH --output="cpc_server.%j.%N.out"
#SBATCH --partition=compute
#SBATCH --nodes=1
#SBATCH --export=ALL
#SBATCH -t 24:00:00
#SBATCH -A anl112

module load gromacs
export CPC_DATA=/oasis/scratch/comet/$USER/temp_project/cpc-data
export CPC_HOME=/home/$USER/copernicus
export PATH=$PATH:$CPC_HOME
module load gromacs
cpc-server start
cpc-server bundle -o ~/local_bundle.cnx
sleep 172800  # 48 hours
