#!/usr/bin/env bash

#SBATCH --job-name=recess # Job name
#SBATCH --nodes=1 # should never be anything other than 1
#SBATCH --cpus-per-task=16 # number of cpus to use
#SBATCH --output=%J_met.out # File to which STDOUT will be written
#SBATCH --error=%J_met.err # File to which STDERR will be written

# This is a script to download fastq files

for i in `cat /etc/ace-data/home/skanyerezi/Group2_recess/Data/id.txt`
do
        /etc/ace-data/home/skanyerezi/.conda/envs/snippy-env/bin/fastq-dump.2.11.0 --gzip --split-e $i --outdir /etc/ace-data/home/skanyerezi/Group2_recess/Data/raw
done
