#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=20GB
#SBATCH --time=02:00:00
#SBATCH --job-name=IndexingUndesiredRNA
#SBATCH --mail-user=balagopal.rajagopal@students.unibe.ch
#SBATCH --mail-type=end,fail
#SBATCH --output=indexing_undesiredRNA_output_%j.txt
#SBATCH --error=indexing_undesiredRNA_error_%j.txt

## Loads Bowtie2 software into the environment.
module load UHTS/Aligner/bowtie2/2.3.4.1

## Undesired RNA indexes will be built in accordance with this command.
bowtie2-build GRCh38_p13_r-t-sno-sn-RNA_ENSEMBL_NCBI_GtRNAdb.fa GRCh38_p13_r-t-sno-sn-RNA_ENSEMBL_NCBI_GtRNAdb
