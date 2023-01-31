#!/usr/bin/env bash

#SBATCH --cpus-per-task=12
#SBATCH --mem-per-cpu=20GB
#SBATCH --time=02:00:00
#SBATCH --job-name=sorting_bam_files
#SBATCH --mail-user=balagopal.rajagopal@students.unibe.cH
#SBATCH --mail-type=end,fail
#SBATCH --output=sorting_bam_files_output_%j.txt
#SBATCH --error=sorting_bam_files_error_%j.txt

## Loads Samtools software into the environment.
module load UHTS/Analysis/samtools/1.8

## Sorting the BAM file using sam tools
for x in $(ls -d *.bam); \
do echo ${x}; \
samtools sort \
-@ 4 \
${x} \
-o $(basename ${x} .bam)_sorted.bam; done

## Remove the unsorted BAM files
rm *GRCh38_p13.bam
