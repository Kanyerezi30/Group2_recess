#!/bin/bash

#SBATCH --job-name=snippy # Job name
#SBATCH --nodes=1 # should never be anything other than 1
#SBATCH --cpus-per-task=16 # number of cpus to use
#SBATCH --output=snippy_stdout.out # File to which STDOUT will be written
#SBATCH --error=snippy_stderr.err # File to which STDERR will be written

path='/etc/ace-data/home/skanyerezi/Group2_recess/Data'
for i in `ls ${path}/raw/  | cut -f1 -d"_" | sort -u`
do
        R1=${path}/raw/${i}_1.fastq.gz
        R2=${path}/raw/${i}_2.fastq.gz
        echo "================================running snippy for $i========================================================================="
        snippy --cpus 16 --outdir ${path}/results/snippy_var/${i} --ref ${path}/reference/ref.fasta --R1 $R1 --R2 $R2
        echo "================================snippy for $i is done========================================================================="
done
