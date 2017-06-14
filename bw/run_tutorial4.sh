#!/bin/bash
export SERVER=`grep client_host ~/local_bundle2.cnx |cut -d\" -f4`
cpcc login cpc-admin
cpcc start alanine-dipeptide-msm
cpcc import msm
# make the MSM function instance
cpcc instance msm::msm_gmx_adaptive msm
# and start the function instance
cpcc activate

cpcc transact
# set its values. 
# Descriptions can be obtained with cpcc info msm::msm_mgx_adaptive
cpcc setf msm:in.grompp.top $HOME/copernicus/examples/msm/alanine-dipeptide-msm/topol.top
cpcc setf msm:in.grompp.mdp $HOME/copernicus/examples/msm/alanine-dipeptide-msm/grompp.mdp

# starting configurations
cpcc setf msm:in.confs[+] $HOME/copernicus/examples/msm/alanine-dipeptide-msm/equil0.gro
cpcc setf msm:in.confs[+] $HOME/copernicus/examples/msm/alanine-dipeptide-msm/equil1.gro
cpcc setf msm:in.confs[+] $HOME/copernicus/examples/msm/alanine-dipeptide-msm/equil2.gro
cpcc setf msm:in.confs[+] $HOME/copernicus/examples/msm/alanine-dipeptide-msm/equil3.gro

# re-clustering frequency(ns)
cpcc set msm:in.recluster 1.0
# number of simulations to start per macrostate
cpcc set msm:in.num_sim 20
cpcc set msm:in.num_microstates 100
cpcc set msm:in.num_macrostates 10
cpcc set msm:in.lag_time 2
# select these atoms for clusterin:
cpcc set msm:in.grpname  Protein

# set the maximum number of generations:
cpcc set msm:in.num_generations 5

# commit the changes
cpcc commit

cpcc s
cpcc q
