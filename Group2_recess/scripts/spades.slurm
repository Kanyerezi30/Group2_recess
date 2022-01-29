#!/bin/bash

#SBATCH --job-name=assembly # Job name
#SBATCH --nodes=1 # should never be anything other than 1
#SBATCH --cpus-per-task=16 # number of cpus to use
#SBATCH --output=%J_assemly.out # File to which STDOUT will be written
#SBATCH --error=%J_assembly.err # File to which STDERR will be written

for i in `ls /etc/ace-data/home/skanyerezi/Group2_recess/Data/raw/ | cut -f1 -d"_" | sort -u`
do
	R1=/etc/ace-data/home/skanyerezi/Group2_recess/Data/raw/${i}_1.fastq.gz
	R2=/etc/ace-data/home/skanyerezi/Group2_recess/Data/raw/${i}_2.fastq.gz
	spades.py -1 $R1 -2 $R2 -o /etc/ace-data/home/skanyerezi/Group2_recess/Data/results/${i}
done
