# Installation of the package (to be done only once!)
install.packages("devtools")

library(devtools)

install_github(repo = "lcalviell/Ribo-seQC")

###### Analysis part ######
# Change the working directory to a local directory that contains data.
setwd("~/Desktop/RnaSequencing/Project_work/Genome")

# Load the package
library(RiboseQC)

# Prepare genome file (to be done only once!!!)
prepare_annotation_files(annotation_directory = ".",
                         twobit_file = "GRCh38.p13.genome.2bit",
                         gtf_file = "gencode.v41.annotation.gtf",
                         scientific_name = "Homo.sapiens",
                         annotation_name = "GRCh38_p13",
                         export_bed_tables_TxDb = F,
                         forge_BSgenome = T,
                         create_TxDb = T)


# Genome mapped sorted-BAM files 

genome_bam <- c("bam_files/RPF_WT_Rep1_clpd_tr_no_r-t-sno-sn-RNA.fastq.gz_GRCh38_p13_sorted.bam",
                "bam_files/RPF_WT_Rep2_clpd_tr_no_r-t-sno-sn-RNA.fastq.gz_GRCh38_p13_sorted.bam",
                "bam_files/RPF_KO_Rep1_clpd_tr_no_r-t-sno-sn-RNA.fastq.gz_GRCh38_p13_sorted.bam",
                "bam_files/RPF_KO_Rep2_clpd_tr_no_r-t-sno-sn-RNA.fastq.gz_GRCh38_p13_sorted.bam")

load_annotation("gencode.v41.annotation.gtf_Rannot")

###### QC plots ######

RiboseQC_analysis(annotation_file ="gencode.v41.annotation.gtf_Rannot",
                  bam_files = genome_bam,
                  fast_mode = T,
                  report_file = "RPF_samples_QC.html",
                  sample_names = c("WT_Rep1", "WT_Rep2",
                                   "KO_Rep1", "KO_Rep2"),
                  dest_names = c("WT_Rep1", "WT_Rep2",
                                 "KO_Rep1", "KO_Rep2"),
                  write_tmp_files = F)

