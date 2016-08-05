#!/bin/bash
#PBS -N "cpc_worker"
#PBS -o "cpc_worker2.%j.%N.out"
#PBS -e "cpc_worker2.%j.%N.err"
#PBS -l nodes=1:ppn=32:xe
#PBS -V
#PBS -l walltime=01:40:00


module load gromacs
module load bwpy
export MPIRUN=aprun
export CPC_DATA=$HOME/cpc-data
export CPC_HOME=$HOME/copernicus
export CPC_TEMP=$HOME/worker_$PBS_JOBID
export PATH=$PATH:$CPC_HOME
mkdir $CPC_TEMP
cpc-worker -d -c local_bundle.cnx -wd $CPC_TEMP -q 20 mpi -n 32
rm -r $CPC_TEMP
