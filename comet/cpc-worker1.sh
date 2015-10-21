#!/bin/bash
#SBATCH --job-name="cpc_worker"
#SBATCH --output="cpc_worker1.%j.%N.out"
#SBATCH --partition=debug
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=24
#SBATCH --export=ALL
#SBATCH -t 12:00:00
#SBATCH -A unc104

module load gromacs
export MPIRUN=ibrun
export CPC_DATA=/oasis/scratch/comet/$USER/temp_project/cpc-data
export CPC_HOME=/home/$USER/copernicus
export CPC_TEMP=/oasis/scratch/comet/$USER/temp_project/worker_$SLURM_JOB_ID
export PATH=$PATH:$CPC_HOME
mkdir $CPC_TEMP
cpc-worker -c local_bundle.cnx -wd $CPC_TEMP -q 20 mpi -n 24
rm -r $CPC_TEMP
