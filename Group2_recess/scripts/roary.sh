#!/bin/bash

#SBATCH --job-name=pan # Job name
#SBATCH --nodes=1 # should never be anything other than 1
#SBATCH --cpus-per-task=16 # number of cpus to use
#SBATCH --output=pan_stdout.out # File to which STDOUT will be written
#SBATCH --error=pan_stderr.err # File to which STDERR will be written


path='/etc/ace-data/home/skanyerezi/Group2_recess/Data/results/'

for i in `cat ${path}/assembly_contamination/passed_contamination_ids.txt`
do
	cp ${path}/annotation/${i}/${i}.gff ${path}/pangenome/roary/data/ 
done
#roary *.gff -s -p 16 -r -e -n -f pan_roary > roary.stdout.log 2> roary.err
