#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=20M
#SBATCH --time=02:00:00
#SBATCH --job-name=fastqc_processed_files
#SBATCH --mail-user=balagopal.rajagopal@students.unibe.cH
#SBATCH --mail-type=end,fail
#SBATCH --output=fastqc_processed_files_output_%j.txt
#SBATCH --error=fastqc_processed_files_error_%j.txt

## Loads fastqc software into the environment
module add UHTS/Quality_control/fastqc/0.11.9

## Creating a new directory for output file storage
mkdir processsedfastqc

fastqc -o ./processsedfastqc -f fastq *_clpd_tr.fastq.gz
