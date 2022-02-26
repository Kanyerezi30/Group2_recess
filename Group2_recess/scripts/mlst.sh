#!/bin/bash

#SBATCH --job-name=ST # Job name
#SBATCH --nodes=1 # should never be anything other than 1
#SBATCH --cpus-per-task=16 # number of cpus to use
#SBATCH --output=mlst_stdout.out # File to which STDOUT will be written
#SBATCH --error=mlst_stderr.err # File to which STDERR will be written

path='/etc/ace-data/home/skanyerezi/Group2_recess/Data/results'

mlst ${path}/assembly/*.fasta --csv > ${path}/ST/st.csv
