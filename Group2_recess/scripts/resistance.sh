#!/bin/bash

#SBATCH --job-name=resistance # Job name
#SBATCH --nodes=1 # should never be anything other than 1
#SBATCH --cpus-per-task=16 # number of cpus to use
#SBATCH --output=%J_res.out # File to which STDOUT will be written
#SBATCH --error=%J_res.err # File to which STDERR will be written

path='/etc/ace-data/home/skanyerezi/Group2_recess/Data'

abricate --db resfinder ${path}/results/assembly/*fasta > ${path}/results/resistome/res.tab # find acquired resistance

abricate --db vfdb ${path}/results/assembly/*fasta > ${path}/results/virulence/vir.tab # find virulence genes

abricate --summary ${path}/results/resistome/res.tab > ${path}/results/resistome/summary_res.tab # create gene presence/absence file

abricate --summary ${path}/results/virulence/vir.tab > ${path}/results/virulence/summary_vir.tab # create gene presence/absence file
