#!/bin/bash
#SBATCH --job-name="cpc_worker"
#SBATCH --output="cpc_worker2.%j.%N.out"
#SBATCH -p RM
#SBATCH --nodes=2
#SBATCH --export=ALL
#SBATCH -t 01:00:00


# kludge to keep gmx and gmx_mpi consistent
export PATH=$PATH:/home/kasson/bin
# module load gromacs
module load python
export MPIRUN=mpirun
export CPC_DATA=$HOME/cpc-data
export CPC_HOME=$HOME/copernicus
export CPC_TEMP=$HOME/worker_$SLURM_JOB_ID
export PATH=$PATH:$CPC_HOME
mkdir $CPC_TEMP
cpc-worker -d -c local_bundle.cnx -wd $CPC_TEMP -q 20 mpi -n 56
rm -r $CPC_TEMP
