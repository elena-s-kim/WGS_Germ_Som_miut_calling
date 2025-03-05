#compress_and_index.sh
#!/bin/bash

# Define the paths to your VCF files
NORMAL_VCF="/Volumes/SGT_18TB/Mesothelioma_SGT_18TB/Variant_calling_outputs_dltltr/variant_calling_output1/SRR18543960_61/SRR18543960_61.vcf/0000.vcf"
TUMOR_VCF="/Volumes/SGT_18TB/Mesothelioma_SGT_18TB/Variant_calling_outputs_dltltr/variant_calling_output1/SRR18543960_61/SRR18543960_61.vcf/0001.vcf"

# Compress the VCF files using bgzip
bgzip -c $NORMAL_VCF > ${NORMAL_VCF}.gz
bgzip -c $TUMOR_VCF > ${TUMOR_VCF}.gz

# Index the compressed VCF files using tabix
tabix -p vcf ${NORMAL_VCF}.gz
tabix -p vcf ${TUMOR_VCF}.gz

