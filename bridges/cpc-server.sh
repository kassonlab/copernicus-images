#!/bin/bash
#SBATCH --job-name="cpc_server"
#SBATCH --output="cpc_server.%j.%N.out"
#SBATCH -p RM
#SBATCH -N 1
#SBATCH --export=ALL
#SBATCH -t 2:00:00

if [ "$SERVER_PORT" == "" ]; then
    export SERVER_PORT=13807
    export CLIENT_PORT=14807
fi

# kludge because we have gmx_mpi but no gmx on bridges
# module load gromacs
export PATH=$PATH:/home/kasson/bin
module load anaconda
module load hdf5

export CPC_DATA=$HOME/cpc-data
export CPC_HOME=$HOME/copernicus
export PATH=$PATH:$CPC_HOME
export PYTHONPATH=$PYTHONPATH:$HOME:$CPC_HOME
cpc-server start
cpc-server config server_secure_port $SERVER_PORT
cpc-server config client_secure_port $CLIENT_PORT 
cpc-server bundle -o local_bundle.cnx
sleep 172800  # 48 hours
