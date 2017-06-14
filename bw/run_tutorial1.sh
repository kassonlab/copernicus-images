#!/bin/bash
export SERVER=`grep client_host ~/local_bundle2.cnx |cut -d\" -f4`
cpcc add-server $SERVER 14807
cpcc login cpc-admin
cpcc start md_simulations_test
cpcc import gromacs
cpcc instance gromacs::grompps grompp
cpcc instance gromacs::mdruns mdrun
cpcc activate

cpcc transact
cpcc setf grompp:in.conf[+] ~/copernicus/examples/mdrun-test/conf.gro
cpcc setf grompp:in.mdp[+] ~/copernicus/examples/mdrun-test/grompp.mdp
cpcc setf grompp:in.top[+] ~/copernicus/examples/mdrun-test/topol.top 
cpcc connect grompp:out.tpr mdrun:in.tpr
cpcc commit

cpcc q
cpcc s
