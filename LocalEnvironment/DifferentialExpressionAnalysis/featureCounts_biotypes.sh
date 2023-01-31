#!/usr/bin/env bash

## Download featureCount - https://subread.sourceforge.net/

## -T specifies the number (n) of threads to be used.
## -t Specify the feature type(s)(GTF.featureType). Here it is exon
## -g Specify the attribute type used to group features into meta-features (eg. genes) when GTF annotation is provided.
## Extract reads mapped to different biotypes
featureCounts -T 4 -t exon -g gene_biotype -a /Users/balu/Desktop/RnaSequencing/sorted_bam_files/Homo_sapiens.GRCh38.107.gtf -o biotype_counts_rawfile.txt *_GRCh38_p13_sorted.bam

## Extract Biotype and Sample columns
cut -f 1,7-10 biotype_counts_rawfile.txt > biotype_counts_processed.txt
