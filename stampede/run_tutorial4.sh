#!/bin/bash
export SERVER=`grep tacc ~/local_bundle.cnx |cut -f4 -d\"`
cpcc login cpc-admin
cpcc start alanine-dipeptide-msm
cpcc import msm
cpcc instance msm:msm_gmx_adaptive msm
cpcc activate

cpcc transact
cpcc setf msm:in.grompp.top ~/copernicus/examples/msm-test/topol.top
cpcc setf msm:in.grompp.mdp ~/copernicus/examples/msm-test/grompp.mdp

cpcc setf msm:in.confs[+] ~/copernicus/examples/msm-test/equil0.gro
cpcc setf msm:in.confs[+] ~/copernicus/examples/msm-test/equil1.gro
cpcc setf msm:in.confs[+] ~/copernicus/examples/msm-test/equil2.gro
cpcc setf msm:in.confs[+] ~/copernicus/examples/msm-test/equil3.gro

cpcc set msm:in.recluster 1.0
cpcc set msm:in.num_sim 20

cpcc set msm:in.num_microstates 100
cpcc set msm:in.num_macrostates 10
cpcc set msm:in.lag_time 2

cpcc set msm:in.grpname  Protein
cpcc set msm:in.num_generations 6
cpcc commit

cpcc q
cpcc s
