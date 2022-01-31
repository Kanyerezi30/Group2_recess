#!/bin/bash

#SBATCH --job-name=check_recess # Job name
#SBATCH --nodes=1 # should never be anything other than 1
#SBATCH --cpus-per-task=16 # number of cpus to use
#SBATCH --output=check_stdout.out # File to which STDOUT will be written
#SBATCH --error=check_stderr.err # File to which STDERR will be written

path='/etc/ace-data/home/skanyerezi/Group2_recess/Data/results'
checkm taxonomy_wf species "Escherichia coli" ${path}/assembly checkmout -t 16 -x fasta  > ${path}/assembly_contamination/checkmoutput.tsv

#tail -431 checkmoutput.tsv | head -429 | awk '$15 < 5 && $14 > 90' | awk '{print $1}' > contamination_5 #extract those with contamination
head -138 ${path}/assembly_contamination/checkmoutput.tsv | tail -103 | awk '$15 < 10 && $14 > 80' | awk '{print $1}' > ${path}/assembly_contamination/passed_contamination_ids.txt # extract those with acceptable contamination levels
