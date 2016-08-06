#!/bin/bash
export SERVER=`grep nid ~/local_bundle2.cnx |cut -f4 -d\"`
cpcc add-server $SERVER
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
