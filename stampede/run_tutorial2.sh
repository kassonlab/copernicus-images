#!/bin/bash
# Code 2015 by Peter Kasson
# Call this with a directory of structures and a single topology
if [ $# -lt 2 ]; then
    echo "Usage:"
    echo "$0 structures topology"
    exit 1
fi


export SERVER=`grep tacc ~/local_bundle.cnx |cut -f4 -d\"`
cpcc login cpc-admin
cpcc start md_simulations_test2
cpcc import gromacs
cpcc instance gromacs::grompps grompp
cpcc instance gromacs::grompps grompp2
cpcc instance gromacs::mdruns mdrun
cpcc instance gromacs::mdruns mdrun2
cpcc activate

cpcc transact
# let's do this with something a bit more complicated
for i in $( ls $1); do
    cpcc setf grompp:in.conf[+] $i
done
cpcc setf grompp:in.mdp[+] ~/copernicus/examples/mdrun-test/grompp.mdp
cpcc setf grompp:in.top[+] $2
cpcc connect grompp:out.tpr mdrun:in.tpr
cpcc connect mdrun:out.conf grompp2:in.conf
cpcc setf grompp2:in.top[+] $2
cpcc setf grompp2:in.mdp[+] ~/copernicus/examples/mdrun-test/grompp.mdp
cpcc connect grompp2:out.tpr mdrun2:in.tpr
cpcc commit

cpcc q
cpcc s
