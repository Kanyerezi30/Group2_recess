#!/usr/bin/env bash
# This is a script designed to transform scaffolds.fasta files in each directory to a better naming

for i in `ls /etc/ace-data/home/skanyerezi/Group2_recess/Data/results/assembly`
do
	path='/etc/ace-data/home/skanyerezi/Group2_recess/Data/results/assembly'
	cut -f1,2 -d"_" ${path}/${i}/scaffolds.fasta | sed s/NODE/C/g > ${path}/${i}_scaffolds.fasta
done

