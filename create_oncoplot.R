#create_oncoplot.R file
# Install maftools if not already installed
if (!requireNamespace("maftools", quietly = TRUE))
    install.packages("maftools")

library(maftools)

# Load the detailed MAF file
maf_file <- "/Users/elena_s_kim/Documents/Oncoprint_06122024/combined_variants_dedup.maf"
maf <- read.maf(maf = maf_file, verbose = FALSE)

# Check if MAF contains data
if (nrow(maf@data) == 0) {
  stop("No non-synonymous mutations found. Check the data extraction process.")
}

# Print the structure of the MAF data for debugging
str(maf@data)

# Generate the oncoplot and save it as a PDF
output_dir <- "/Users/elena_s_kim/Documents/Oncoprint_06122024/"
output_file <- file.path(output_dir, "oncoprint.pdf")

pdf(output_file, width = 12, height = 8)
oncoplot(maf = maf, top = 20)
dev.off()
