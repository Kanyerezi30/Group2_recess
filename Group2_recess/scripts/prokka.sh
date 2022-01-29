#!/bin/bash

#SBATCH --job-name=PRJEB10533_paired # Job name
#SBATCH --nodes=1 # should never be anything other than 1
#SBATCH --cpus-per-task=16 # number of cpus to use
#SBATCH --output=paired_stdout.out # File to which STDOUT will be written
#SBATCH --error=paired_stderr.err # File to which STDERR will be written

#This is a script designed to perform annotation using prokka
path='/etc/ace-data/home/skanyerezi/Group2_recess/Data/results'
mkdir ${path}/annotation
for i in `ls /etc/ace-data/home/skanyerezi/Group2_recess/Data/results/assembly/*fasta`
do
	output=`basename $i _scaffolds.fasta`
	prokka --outdir ${path}/annotation/${output} --prefix $output $i --usegenus -genus Escherichia --cpus 16
done
