#!/bin/bash

#SBATCH --job-name=assembly # Job name
#SBATCH --nodes=1 # should never be anything other than 1
#SBATCH --cpus-per-task=16 # number of cpus to use
#SBATCH --output=%J_assemly.out # File to which STDOUT will be written
#SBATCH --error=%J_assembly.err # File to which STDERR will be written

# perform clermon typing
path='/etc/ace-data/home/skanyerezi/Group2_recess'
ls ${path}/Data/results/assembly/*fasta | tr "\n" "@" | sed 's/@$/\n/' > clermon_input.txt # create appropriate input file
${path}/clermon/ClermonTyping/clermonTyping.sh --fasta  `cat clermon_input.txt` # perform the actual typing
