#!/usr/bin/env bash

#SBATCH --cpus-per-task=8
#SBATCH --mem-per-cpu=20GB
#SBATCH --time=02:00:00
#SBATCH --job-name=IndexingGenome
#SBATCH --mail-user=balagopal.rajagopal@students.unibe.cH
#SBATCH --mail-type=end,fail
#SBATCH --output=indexing_genome_output_%j.txt
#SBATCH --error=indexing_genome_error_%j.txt

## Loads Bowtie2 software into the environment.
module load UHTS/Aligner/bowtie2/2.3.4.1

## Genome indexes will be built in accordance with this command.
bowtie2-build GRCh38.p13.genome.fa GRCh38.p13.genome

