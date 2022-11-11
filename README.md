# chip-var
This is a workflow for calling and annotating CHIP variants. 
The workflow calls the variants from the BAM file using vardict, which are then filtered based on the simple sample filtering criteria. The filtered variants are then processed, by sorting and normalizing and concating the complex and normal variants into a single VCF file. The concated variants are annotated with COSMIC prevalence counts and converted from VCF to MAF file format. 

For detailed documentation refer to https://cmo-ci.gitbook.io/chip-variant-calling-and-processing/

### Workflows used

- [vardict workflow](https://msk-access.gitbook.io/subworkflows/)
- [bcftools tabix](https://msk-access.gitbook.io/command-line-tools-cwl/bcftools_1.15.1/)
- [bcftools norm](https://msk-access.gitbook.io/command-line-tools-cwl/bcftools_1.15.1/)
- [bcftools sort](https://msk-access.gitbook.io/command-line-tools-cwl/bcftools_1.15.1/)

#### Usage

```shell
usage: chip-var.cwl -h
       --reference_fasta REFERENCE_FASTA --input_bam_case INPUT_BAM_CASE
       [--bedfile BEDFILE] --sample_name SAMPLE_NAME
       [--vardict_allele_frequency_threshold VARDICT_ALLELE_FREQUENCY_THRESHOLD]
       [--retain_info RETAIN_INFO] --concat_output_name CONCAT_OUTPUT_NAME
       [--vardict_output_vcf_name VARDICT_OUTPUT_VCF_NAME]
       --input_cosmicprevalenceDB_vcf INPUT_COSMICPREVALENCEDB_VCF
       --input_cosmicCountDB_vcf INPUT_COSMICCOUNTDB_VCF
       [--output_mafName OUTPUT_MAFNAME]
       [--snpsift_prevalOpName SNPSIFT_PREVALOPNAME]
       [--snpsift_countOpName SNPSIFT_COUNTOPNAME]
       [job_order]

positional arguments:
  job_order             Job input json file

optional arguments:
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
  --output_mafName OUTPUT_MAFNAME
  --snpsift_prevalOpName SNPSIFT_PREVALOPNAME
  --snpsift_countOpName SNPSIFT_COUNTOPNAME
```

