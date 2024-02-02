# Installation and Usage

## Usage

```
usage: chip-var.cwl [-h] --reference_fasta REFERENCE_FASTA --input_bam_case INPUT_BAM_CASE
                    [--bedfile BEDFILE] --sample_name SAMPLE_NAME
                    [--vardict_allele_frequency_threshold VARDICT_ALLELE_FREQUENCY_THRESHOLD]
                    [--retain_info RETAIN_INFO] --concat_output_name CONCAT_OUTPUT_NAME
                    [--vardict_output_vcf_name VARDICT_OUTPUT_VCF_NAME]
                    --input_cosmicprevalenceDB_vcf INPUT_COSMICPREVALENCEDB_VCF
                    --input_cosmicCountDB_vcf INPUT_COSMICCOUNTDB_VCF
                    [--snpsift_prevalOpName SNPSIFT_PREVALOPNAME]
                    [--snpsift_countOpName SNPSIFT_COUNTOPNAME] --input_complexity_bed
                    INPUT_COMPLEXITY_BED
                    [--output_complexity_filename OUTPUT_COMPLEXITY_FILENAME]
                    [--column_name_complexity COLUMN_NAME_COMPLEXITY] --oncoKbApiToken
                    ONCOKBAPITOKEN --opOncoKbMafName OPONCOKBMAFNAME
                    [--output_vcf2mafName OUTPUT_VCF2MAFNAME] --input_mappability_bed
                    INPUT_MAPPABILITY_BED
                    [--output_mappability_filename OUTPUT_MAPPABILITY_FILENAME]
                    [--column_name_mappability COLUMN_NAME_MAPPABILITY]
                    --input_47kchpd_tsv_file INPUT_47KCHPD_TSV_FILE --input_hotspot_tsv_file
                    INPUT_HOTSPOT_TSV_FILE --input_panmeloid_tsv_file INPUT_PANMELOID_TSV_FILE
                    [job_order]

chip-var

positional arguments:
  job_order             Job input json file

options:
  -h, --help            show this help message and exit
  --reference_fasta REFERENCE_FASTA
  --input_bam_case INPUT_BAM_CASE
  --bedfile BEDFILE
  --sample_name SAMPLE_NAME
  --vardict_allele_frequency_threshold VARDICT_ALLELE_FREQUENCY_THRESHOLD
  --retain_info RETAIN_INFO
  --concat_output_name CONCAT_OUTPUT_NAME
  --vardict_output_vcf_name VARDICT_OUTPUT_VCF_NAME
  --input_cosmicprevalenceDB_vcf INPUT_COSMICPREVALENCEDB_VCF
  --input_cosmicCountDB_vcf INPUT_COSMICCOUNTDB_VCF
  --snpsift_prevalOpName SNPSIFT_PREVALOPNAME
  --snpsift_countOpName SNPSIFT_COUNTOPNAME
  --input_complexity_bed INPUT_COMPLEXITY_BED
  --output_complexity_filename OUTPUT_COMPLEXITY_FILENAME
  --column_name_complexity COLUMN_NAME_COMPLEXITY
  --oncoKbApiToken ONCOKBAPITOKEN
  --opOncoKbMafName OPONCOKBMAFNAME
  --output_vcf2mafName OUTPUT_VCF2MAFNAME
  --input_mappability_bed INPUT_MAPPABILITY_BED
  --output_mappability_filename OUTPUT_MAPPABILITY_FILENAME
  --column_name_mappability COLUMN_NAME_MAPPABILITY
  --input_47kchpd_tsv_file INPUT_47KCHPD_TSV_FILE
  --input_hotspot_tsv_file INPUT_HOTSPOT_TSV_FILE
  --input_panmeloid_tsv_file INPUT_PANMELOID_TSV_FILE
```
