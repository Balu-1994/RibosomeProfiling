#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=10GB
#SBATCH --time=02:00:00
#SBATCH --job-name=mapping_genome
#SBATCH --mail-user=balagopal.rajagopal@students.unibe.cH
#SBATCH --mail-type=end,fail
#SBATCH --output=mapping_genome_output_%j.txt
#SBATCH --error=mapping_genome_error_%j.txt

## Loads Bowtie2 software into the environment.
module load UHTS/Aligner/bowtie2/2.3.4.1

## Loads Samtools software into the environment.
module load UHTS/Analysis/samtools/1.8

## --threads INT Number of additional threads to use is 4
##  -N <int> max # mismatches in seed alignment; can be 0 or 1 (0)
## -x After put Index filename prefix (minus trailing .X.bt2).
## You need to change the index file location in your directory.
## -U Input fastq files
## Using Samtools we converts the output into bam files.
## Mapping to genome.

for x in $(ls -d *RNA.fastq); \
do echo ${x}; \
bowtie2 \
--threads 4 \
-N 1 \
-x \
/home/brajagopal/rna_sequencing/genome_annotation/GRCh38.p13.genome \
-U ${x} \
2>> $(basename ${x} .fastq.gz)_GRCh38_p13_log.txt | \
samtools view -S -b -o > $(basename ${x} .fastq)_GRCh38_p13.bam -; done
