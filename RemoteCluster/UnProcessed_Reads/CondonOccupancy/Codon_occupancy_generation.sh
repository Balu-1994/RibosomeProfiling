#!/usr/bin/env bash

#SBATCH --cpus-per-task=12
#SBATCH --mem-per-cpu=2GB
#SBATCH --time=02:00:00
#SBATCH --job-name=Codon_occupancy_generation
#SBATCH --mail-user=balagopal.rajagopal@students.unibe.cH
#SBATCH --mail-type=end,fail
#SBATCH --output=Codon_occupancy_generation_output_%j.txt
#SBATCH --error=Codon_occupancy_generation_error_%j.txt

## Need to downloaded the Codon_occupancy_cal.sh scrpit from github: https://github.com/LeidelLab/Codon_occupancy_cal
## Change the path for Transcriptome to the local directory that contains data.
## Change the path for Sam files to the local directory that contains data.

./Codon_occupancy_cal.sh \
/home/brajagopal/rna_sequencing/transc/GRCh38_p13_APPRIS_CDS_plus18_SingleLine.fa \
/home/brajagopal/rna_sequencing/unprocessed_fastq/RPF_KO_Rep1_clpd_tr_no_r-t-sno-sn-RNA.fastq.gz_GRCh38_p13_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ./RPF_KO_Rep1_Codon_occupancy.txt

./Codon_occupancy_cal.sh \
/home/brajagopal/rna_sequencing/transc/GRCh38_p13_APPRIS_CDS_plus18_SingleLine.fa \
/home/brajagopal/rna_sequencing/unprocessed_fastq/RPF_KO_Rep2_clpd_tr_no_r-t-sno-sn-RNA.fastq.gz_GRCh38_p13_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ./RPF_KO_Rep2_Codon_occupancy.txt

./Codon_occupancy_cal.sh \
/home/brajagopal/rna_sequencing/transc/GRCh38_p13_APPRIS_CDS_plus18_SingleLine.fa \
/home/brajagopal/rna_sequencing/unprocessed_fastq/RPF_WT_Rep1_clpd_tr_no_r-t-sno-sn-RNA.fastq.gz_GRCh38_p13_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ./RPF_WT_Rep1_Codon_occupancy.txt

./Codon_occupancy_cal.sh \
/home/brajagopal/rna_sequencing/transc/GRCh38_p13_APPRIS_CDS_plus18_SingleLine.fa \
/home/brajagopal/rna_sequencing/unprocessed_fastq/RPF_WT_Rep2_clpd_tr_no_r-t-sno-sn-RNA.fastq.gz_GRCh38_p13_APPRIS_CDS.sam

mv ./Codon_occupancy.txt ./RPF_WT_Rep2_Codon_occupancy.txt
