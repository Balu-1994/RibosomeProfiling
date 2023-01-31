#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=20GB
#SBATCH --time=02:00:00
#SBATCH --job-name=clipping_adapter
#SBATCH --mail-user=balagopal.rajagopal@students.unibe.cH
#SBATCH --mail-type=end,fail
#SBATCH --output=clipping_adapter_output_%j.txt
#SBATCH --error=clipping_adapter_error_%j.txt

## Loads cutadapt software into the environment
module add UHTS/Quality_control/cutadapt/2.5

## -j 4 It will enable Multi-core
## -a we can give regular 3’ adapter like "CTGTAGGCACCATCAAT" which is clipped from the 3' end.
## -q 25 Used to trim low-quality ends from reads before adapter removal.
## --minimum-length 25 Will discard processed reads that are shorter than LENGTH 25 and reads which are too short before adapter removal are also discarded. 
## --discard-untrimmed  in this option the read is to be trimmed only if all required adapters were found.
## # Clipping 3' adapter.

for x in $(ls -d *.fastq.gz); do echo ${x}; \
cutadapt \
-j 4 \
-a CTGTAGGCACCATCAAT \
-q 25 \
--minimum-length 25 \
--discard-untrimmed \
-o $(basename ${x} .fastq.gz)_clpd.fastq.gz \
${x} 1> $(basename ${x} .fastq.gz)_clpd_log.txt; done
