# Change the working directory to a local directory that contains data.
setwd("~/Desktop/RnaSequencing/Project_work/sorted_bam_files")

# Import library ggplot2, RColorBrewer, dplyr.
library(ggplot2)
library(RColorBrewer)
library(dplyr)

# # From https://stackoverflow.com/questions/15282580/how-to-generate-a-number-of-most-distinctive-colors-in-r
qual_col_pals = brewer.pal.info[brewer.pal.info$category == 'qual',]
Color = unlist(mapply(brewer.pal, qual_col_pals$maxcolors, rownames(qual_col_pals)))

# The table contains values for each biotype included in the data variable.
data <- read.table(file = "biotype_counts_processed.txt", sep = "\t", header = TRUE)

# Rearrange data so that it matches the next step
data <- data[ , c(1, 4, 5, 2, 3)]

## Rename columns
colnames(data) <- c("Biotype",
                    "WT_1", "WT_2",
                    "KO_1", "KO_2")

## Remove rows with 0 reads in all samples
data <- subset(data, rowSums(data[ , c(2:5)], ) > 0)

# Transforming the data
data_for_plot <- tidyr::gather(data, "Condition", "Reads", 2:5)

# One way of defining sample order
sample_order <- c("WT_1", "WT_2",
                  "KO_1", "KO_2")

# Plotting biotype proportions in reads.
pdf("RPF_biotypes.pdf", paper = "a4", useDingbats = FALSE)
ggplot(data_for_plot, 
       aes(x = factor(Condition, levels = sample_order),
           y = Reads,
           fill = Biotype)) + 
  geom_bar(position = "fill",
           stat = "identity",
           color = "black") +
  scale_fill_manual(values = Color) +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90)) +
  xlab("") +
  ylab("Proportion of mapped reads")
dev.off()
