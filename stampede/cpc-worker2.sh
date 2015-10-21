#!/bin/bash
#SBATCH --job-name="cpc_worker"
#SBATCH --output="cpc_worker2.%j.%N.out"
#SBATCH --partition=development
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=16
#SBATCH --export=ALL
#SBATCH -t 01:00:00


module load gromacs
module load python
export MPIRUN=ibrun
export CPC_DATA=$WORK/cpc-data
export CPC_HOME=$HOME/copernicus
export CPC_TEMP=$WORK/worker_$SLURM_JOB_ID
export PATH=$PATH:$CPC_HOME
mkdir $CPC_TEMP
cpc-worker -d -c local_bundle.cnx -wd $CPC_TEMP -q 20 mpi -n 32
rm -r $CPC_TEMP
