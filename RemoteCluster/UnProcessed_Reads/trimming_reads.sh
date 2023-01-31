#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=20GB
#SBATCH --time=02:00:00
#SBATCH --job-name=trimming_reads
#SBATCH --mail-user=balagopal.rajagopal@students.unibe.cH
#SBATCH --mail-type=end,fail
#SBATCH --output=trimming_reads_output_%j.txt
#SBATCH --error=trimming_reads_error_%j.txt

## Loads cutadapt software into the environment
module add UHTS/Quality_control/cutadapt/2.5

## -j 4 It will enable Multi-core
## -q 25 Used to trim low-quality ends from reads before adapter removal.
## --cut -4 Will unconditionally remove 4th bases from the beginning or end of each reads.
## --minimum-length 25 Will discard processed reads that are shorter than LENGTH 25 and reads which are too short before adapter removal are also discarded.
## Trim 4 nt (randomized bases) from the 3' end.

for x in $(ls -d *_clpd.fastq.gz); do echo ${x}; \
cutadapt \
-j 4 \
-q 25 \
--cut -4 \
--minimum-length 25 \
-o $(basename ${x} .fastq.gz)_tr.fastq.gz \
${x} 1> $(basename ${x} .fastq.gz)_tr_log.txt; done
