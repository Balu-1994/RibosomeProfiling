#!/usr/bin/env bash

#SBATCH --cpus-per-task=12
#SBATCH --mem-per-cpu=20GB
#SBATCH --time=02:00:00
#SBATCH --job-name=mapping_transcriptome
#SBATCH --mail-user=balagopal.rajagopal@students.unibe.cH
#SBATCH --mail-type=end,fail
#SBATCH --output=mapping_transcriptome_output_%j.txt
#SBATCH --error=mapping_transcriptome_error_%j.txt

## Loads Bowtie2 software into the environment.
module load UHTS/Aligner/bowtie2/2.3.4.1

## --threads INT Number of additional threads to use is 4
## --norc do not align reverse-complement version of read (off)
## -N <int> max # mismatches in seed alignment; can be 0 or 1 (0)
## -x After put Index filename prefix (minus trailing .X.bt2).
## You need to change the index file location in your directory.
## -q query input files are FASTQ .fq/.fastq.
## Mapping to transcriptome.

for x in $(ls -d *RNA.fastq.gz); \
do echo ${x}; \
bowtie2 \
--threads 4 \
--norc \
-N 1 \
-x \
/home/brajagopal/rna_sequencing/transcriptome_annotation/GRCh38_p13_APPRIS_CDS_plus18 \
-q ${x} \
-S $(basename ${x} .fastq)_GRCh38_p13_APPRIS_CDS.sam 2> $(basename ${x} .fastq)_GRCh38_p13_APPRIS_CDS_log.txt; done
