#!/bin/bash

#SBATCH --job-name=check_recess # Job name
#SBATCH --nodes=1 # should never be anything other than 1
#SBATCH --cpus-per-task=16 # number of cpus to use
#SBATCH --output=check_stdout.out # File to which STDOUT will be written
#SBATCH --error=check_stderr.err # File to which STDERR will be written

path='/etc/ace-data/home/skanyerezi/Group2_recess/Data/results'
checkm taxonomy_wf species "Escherichia coli" ${path}/assembly checkmout -t 16 -x fasta  > ${path}/assembly_contamination/checkmoutput.tsv
