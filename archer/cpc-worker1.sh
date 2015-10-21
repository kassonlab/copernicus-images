#!/bin/bash
#PBS -N cpc-worker
#PBS -l select=1
#PBS -l walltime=0:20:00
#PBS -A y14-CECAM
#PBS -q R3211496

# Make sure any symbolic links are resolved to absolute path
export PBS_O_WORKDIR=$(readlink -f $PBS_O_WORKDIR)
module load gromacs
module load python-compute
export CPC_HOME=$HOME/copernicus
export PATH=$PATH:$CPC_HOME

cpc-worker -c $WORK/local_bundle.cnx -wd $PBS_O_WORKDIR -q 20 cray -n 24
