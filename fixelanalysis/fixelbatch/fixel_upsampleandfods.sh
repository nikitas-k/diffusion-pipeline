#!/bin/bash

#SBATCH -n 1 # 1 per CPU
#SBATCH -c 5 # number of cpus per task
#SBATCH --nice=5
#SBATCH -p blade-a

source /daten/bin/setup_fsl-5.0.9-cscor.sh
source /beegfs/v1/bin2/setup_freesurfer_530.sh

MRTRIX=/beegfs/scratch/tnc_scratch/aperry/MRtrix/02032017
export PATH=${MRTRIX}/release/bin:${MRTRIX}/scripts:$PATH

export OMP_NUM_THREADS=8

####
#Find all scripting files
#currdir=$(pwd)
pipedir=/beegfs/scratch/tnc_scratch/kfo_pd_connectome/PD_connectome/diffusion-pipeline/fixelanalysis
PATH=$PATH$( find $pipedir/ -not -path '*/\.*'  -type d -printf ":%p" )
#export PATH:$PATH

upsampleandfods  /beegfs/scratch/tnc_scratch/kfo_pd_connectome/PD_connectome AFD2 1.5 upsample #"%%%%" will match to the string  that corresponds to your personalised batch script, or preferred pipeline
