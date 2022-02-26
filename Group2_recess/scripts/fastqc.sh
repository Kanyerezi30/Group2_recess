#!/bin/bash

#SBATCH --job-name=qc_assessment # Job name
#SBATCH --nodes=1 # should never be anything other than 1
#SBATCH --cpus-per-task=16 # number of cpus to use
#SBATCH --output=%J_fastqc.out # File to which STDOUT will be written
#SBATCH --error=%J_fastqc.err # File to which STDERR will be written

# This is a script designed to perform quality assessment using fastqc

path='/etc/ace-data/home/skanyerezi/Group2_recess/Data'
fastqc ${path}/raw/* -o ${path}/results/fastqc_res/
