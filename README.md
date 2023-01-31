<h1>Ribosome Profiling Data Analysis</h1>

## Getting Started
The execution of code is divided into two sections.
1. Remote Cluster Environment - This code needs to be executed in remote cluster environment (e.g. HPC cluster).
2. Local Environment - This code needs to be executed in the local environment (e.g. laptop).

### Prerequisites

All the necessary datasets (unprocessed reads) for the analysis must be downloaded to the remote cluster, together with the corresponding annotation files (Genome annotation, Transcriptome  annotation, Undesired RNA annotation) in their respective directories. Directory details are mentioned below:
1. UnProcessed Reads - UnProcessed_Reads directory
2. Genome Annotation - GenomeAnnotation directory
3. Transcriptome Annotation - TranscriptomeAnnotation directory
4. Undesired RNA Annotation - UndesiredRNAAnnotation directory

### Execution Procedure

All the scripts needs to be executed in the below mentioned project executions structure.
1. All scripts present in the remote cluster environment must be executed.
2. The output bam files obtained from sorting bam files script and the txt files obtained from Codon occupancy generation script needs to be downloaded to the local environment.
3. Once all the files mentioned in the above step are downloaded, execute the scripts in the local environment.


# Project Execution Structure
 * [Remote Cluster Environment](./RemoteCluster)
   * [Genome Annotation](./RemoteCluster/GenomeAnnotation)
      * [Indexing Genome](./RemoteCluster/GenomeAnnotation/IndexingGenome.sh)
   * [Transcriptome Annotation](./RemoteCluster/TranscriptomeAnnotation)
      * [Indexing Transcriptome](./RemoteCluster/TranscriptomeAnnotation/IndexingTranscriptome.sh)
      * [Transcriptome To Single Line](./RemoteCluster/TranscriptomeAnnotation/Transcriptome_To_Single_Line.sh)
   * [Undesired RNA Annotation](./RemoteCluster/UndesiredRNAAnnotation)
      * [Join RNA Annotation](./RemoteCluster/UndesiredRNAAnnotation/Join_RNA_Annotation.txt)
      * [Indexing Genome](./RemoteCluster/UndesiredRNAAnnotation/IndexingUndesiredRNA.sh)
   * [UnProcessed Reads](./RemoteCluster/UnProcessed_Reads)
      * [Clipping Adapter](./RemoteCluster/UnProcessed_Reads/clipping_adapter.sh)
      * [Trimming Reads](./RemoteCluster/UnProcessed_Reads/trimming_reads.sh)
      * [Fastqc Processed reads](./RemoteCluster/UnProcessed_Reads/fastqc_processed_files.sh)
      * [Removing Undesired RNAs](./RemoteCluster/UnProcessed_Reads/removing_undesiredRNAs.sh)
      * [Mapping Genome](./RemoteCluster/UnProcessed_Reads/mapping_genome.sh)
      * [Sorting Bam Files](./RemoteCluster/UnProcessed_Reads/sorting_bam_files.sh)
      * [Mapping Transcriptome](./RemoteCluster/UnProcessed_Reads/mapping_transcriptome.sh)
      * [Codon Occupancy](./RemoteCluster/UnProcessed_Reads/CondonOccupancy)
        * [Codon Occupancy Generation](./RemoteCluster/UnProcessed_Reads/CondonOccupancy/Codon_occupancy_generation.sh)
 * [Local Environment](./LocalEnvironment)
   * [Ribo-seQC](./LocalMachine/Ribo-seQC)
      * [Genome 2bit](./LocalEnvironment/Ribo-seQC/genome_2bit.sh)
      * [Quality Control](./LocalEnvironment/Ribo-seQC/Quality_Control.R)
   * [Differential Expression Analysis](./LocalEnvironment/DifferentialExpressionAnalysis)
      * [FeatureCounts CDS](./LocalEnvironment/DifferentialExpressionAnalysis/featureCounts_CDS.sh)
      * [FeatureCounts Biotypes](./LocalEnvironment/DifferentialExpressionAnalysis/featureCounts_biotypes.sh)
      * [RPF Biotypes](./LocalEnvironment/DifferentialExpressionAnalysis/RPF_biotypes.R)
      * [Differentially Expressed Genes](./LocalEnvironment/DifferentialExpressionAnalysis/Differentially_expressed_genes.R)
      * [Gene Ontology Analysis](./LocalEnvironment/DifferentialExpressionAnalysis/Gene_Ontology_Analysis.R)
   * [Codon Occupancy](./LocalEnvironment/CodonOccupancy)
      * [Condon Occupancy](./LocalEnvironment/CodonOccupancy/Condon_Occupancy.R)
 * [README](./README.md)
  
