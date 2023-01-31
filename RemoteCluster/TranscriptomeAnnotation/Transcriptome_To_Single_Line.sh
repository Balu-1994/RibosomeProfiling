#!/usr/bin/env bash

#SBATCH --cpus-per-task=5
#SBATCH --mem-per-cpu=5
#SBATCH --time=00:05:00
#SBATCH --job-name=transcriptome_to_single_line
#SBATCH --mail-user=balagopal.rajagopal@students.unibe.cH
#SBATCH --mail-type=end,fail
#SBATCH --output=awk_output_%j.txt
#SBATCH --error=awk_error_%j.txt

## gzip -d will decompress file.
gzip -d GRCh38_p13_APPRIS_CDS_plus18.fa.gz

## This step converts a multiline Fasta to single Line Fasta.
awk '/^>/ { if(NR>1) print "";  printf("%s\n",$0); next; } { printf("%s",$0);}  END {printf("\n");}' < GRCh38_p13_APPRIS_CDS_plus18.fa > GRCh38_p13_APPRIS_CDS_plus18_SingleLine.fa
