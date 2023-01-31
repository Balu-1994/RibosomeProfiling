#!/usr/bin/env bash

## Download featureCount - https://subread.sourceforge.net/

## -T specifies the number (n) of threads to be used.
## -t Specify the feature type(s)(GTF.featureType). Here it is CDS
## -g Specify the attribute type used to group features into meta-features (eg. genes) when GTF annotation is provided.
## Count reads on CDS
featureCounts -T 4 -t CDS -g gene_id -a /Users/balu/Desktop/RnaSequencing/sorted_bam_files/Homo_sapiens.GRCh38.107.gtf -o CDS_counts_rawfile.txt *_GRCh38_p13_sorted.bam

# Extract GeneID and Sample columns
cut -f 1,7-10 CDS_counts_rawfile.txt > CDS_counts_processed.txt
