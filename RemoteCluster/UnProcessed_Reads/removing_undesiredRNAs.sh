#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=20GB
#SBATCH --time=02:00:00
#SBATCH --job-name=removing_undesiredRNAs
#SBATCH --mail-user=balagopal.rajagopal@students.unibe.cH
#SBATCH --mail-type=end,fail
#SBATCH --output=removing_undesiredRNAs_output_%j.txt
#SBATCH --error=removing_undesiredRNAs_error_%j.txt

## Loads Bowtie2 software into the environment.
module add UHTS/Aligner/bowtie2/2.3.4.1

## -x After put Index filename prefix (minus trailing .X.bt2).
## You need to change the index file location in your directory.
##  --un write unpaired reads that didn't align to <path> given
## Mapping to undesired RNAs.

for x in $(ls -d *tr.fastq.gz); \
do echo ${x}; \
gunzip -cd ${x} | \
bowtie2 \
-x \
/home/brajagopal/rna_sequencing/unprocessed_fastq/bowtie2/GRCh38_p13_r-t-sno-sn-RNA_ENSEMBL_NCBI_GtRNAdb \
- \
--un $(basename ${x} .fastq.gz)_no_r-t-sno-sn-RNA.fastq 2> $(basename ${x} .fastq.gz)_no_r-t-sno-sn-RNA_log.txt > /dev/null; done
