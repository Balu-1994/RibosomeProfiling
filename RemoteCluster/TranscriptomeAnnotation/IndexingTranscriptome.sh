#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=20GB
#SBATCH --time=02:00:00
#SBATCH --job-name=IndexingTranscriptome
#SBATCH --mail-user=balagopal.rajagopal@students.unibe.ch
#SBATCH --mail-type=end,fail
#SBATCH --output=indexing_transcriptome_output_%j.txt
#SBATCH --error=indexing_transcriptome_error_%j.txt

## Loads Bowtie2 software into the environment
module load UHTS/Aligner/bowtie2/2.3.4.1

## Transcriptome indexes will be built in accordance with this command.
bowtie2-build GRCh38_p13_APPRIS_CDS_plus18.fa GRCh38_p13_APPRIS_CDS_plus18

