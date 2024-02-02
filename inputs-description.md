---
description: Input files and parameters required to run workflow
---

# Inputs Description

## Common Parameters

| **Parameter**    | **Description**                                  | **Default** |
| ---------------- | ------------------------------------------------ | ----------- |
| reference\_fasta | Reference FASTA file                             |             |
| sample\_name     | The name of the sample submitted to the workflow |             |

The entire workflow can be divided into 3 parts.\
1\. VARDICT workflow - consisting of calling the variants from VARDICT and normalizing and concatenating the complex and simple Variants in VCF format

| **Parameter**                           | **Description**                                                                                                                                                                                                                                                           | **Default** |
| --------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| BedFile                                 | Target file                                                                                                                                                                                                                                                               |             |
| Vardict\_allele\_frequency\_threshold   | Vardict                                                                                                                                                                                                                                                                   | 0.01        |
| _Minimum\_allele\_frequenc_y            |                                                                                                                                                                                                                                                                           | 0.05        |
| input\_bam\_case:                       | Input CH sample BAM file                                                                                                                                                                                                                                                  |             |
| ad                                      | Allele Depth                                                                                                                                                                                                                                                              | 1           |
| totalDepth                              | Total Depth                                                                                                                                                                                                                                                               | 20          |
| tnRatio                                 | Tumor-Normal Variant Fraction ratio threshold                                                                                                                                                                                                                             | 1           |
| variantFraction                         | Tumor Variant fraction threshold                                                                                                                                                                                                                                          | 5.00E-05    |
| minQual                                 | Minimum variant call quality                                                                                                                                                                                                                                              | 0           |
| allow\_overlaps                         | First coordinate of the next file can precede last record of the current file                                                                                                                                                                                             | TRUE        |
| stdout                                  | Write to standard output, keep original files unchanged                                                                                                                                                                                                                   | TRUE        |
| check-ref                               | what to do when incorrect or missing REF allele is encountered. 's' is to set/fix bad sites. Note that 's' can swap alleles and will update genotypes (GT) and AC counts, but will not attempt to fix PL or other fields. Also it will not fix strand issues in your VCF. | s           |
| multiallelics                           | If multiallelic sites should be split or joined. '+'denotes that the biallelic sites should be joined into a multiallelic record.                                                                                                                                         | +           |
| output-type                             | Output type from BCFtools sort. 'z' denotes compressed VCF                                                                                                                                                                                                                | z           |
| preset                                  | Input format for indexing                                                                                                                                                                                                                                                 | VCF         |
| sample-name\_vardict\_STDFilter.txt     |                                                                                                                                                                                                                                                                           |             |
| sample-name\_single\_filter\_vcf        | VCF file with filtered SNPs                                                                                                                                                                                                                                               |             |
| sample-name\_single\_filer\_complex.vcf | VCF file with filtered complex variant                                                                                                                                                                                                                                    |             |
| sample-name\_vardict\_concatenated.vcf  | VCF file with both complex and simple Variants                                                                                                                                                                                                                            |             |

\
2\. Variant Annotation - The VCF file from the before process is annotated with various files.&#x20;

| **Parameter**                    | **Description**                                                                                | **Default**     |
| -------------------------------- | ---------------------------------------------------------------------------------------------- | --------------- |
| retain\_info                     | Comma-delimited names of INFO fields to retain as extra columns in MAF                         | CNT,TUMOR\_TYPE |
| _min\_hom\_vaf_                  | If GT undefined in VCF, minimum allele fraction to call a variant homozygous                   | 0.7             |
| _buffer\_size_                   | Number of variants VEP loads at a time; Reduce this for low memory systems                     | 5000            |
| custom\_enst                     | List of custom ENST IDs that override canonical selection, in a file                           |                 |
| input\_cosmicCountDB\_vcf        | VCF file from COSMIC database with overall prevalence for a variant                            |                 |
| input\_cosmicprevalenceDB\_vcf   | VCF file from COSMIC database with lineage specific prevalence for a variant                   |                 |
| input\_complexity\_bed           | BED file with complex regions                                                                  |                 |
| input\_mappability\_bed          | BED file with un-mappable regions                                                              |                 |
| oncoKbApiToken                   | oncKB API token file                                                                           |                 |
| input\_47kchpd\_tsv\_file        | TSV file with 47k CH-PD variants                                                               |                 |
| input\_hotspot\_tsv\_file        | TSV file with hotspots obtained from 47k CH-PD variants                                        |                 |
| input\_panmeloid\_tsv\_file      | TSV file with PAN-myeloid variants                                                             |                 |
| opOncoKbMafName                  | output file name for MAF file that comes out of oncoKB annotation                              |                 |
| output\_complexity\_filename     | Output file name for MAF file annotated with complex regions                                   |                 |
| output\_mappability\_filename    | Output file name for MAF file annotated with mappable regions                                  |                 |
| output\_vcf2mafName              | File name for VCF2MAF conversion                                                               |                 |
| output\_maf\_name\_panmyeloid    | Output file name for MAF file annotated with PAN-myeloid dataset                               |                 |
| output\_47kchpd\_maf\_name       | Output file name for MAF file annotated with 47k CH-PD variations                              |                 |
| output\_hotspot\_maf\_name       | Output file name for MAF file annotated with hotspot variations                                |                 |
| snpsift\_countOpName             | Output File name for VCF annotated with COSMIC prevalence                                      |                 |
| snpsift\_prevalOpName            | Output File name for VCF annotated with COSMIC lineage prevalence                              |                 |
| column\_name\_complexity         | Column name in the MAF file where complexity is annotated                                      |                 |
| column\_name\_mappability        | Column name in the MAF file where mappability is annotated                                     |                 |
| output\_column\_name\_panmyeloid | Column name in the MAF file where the presence of variants in PAN-Myeloid dataset is annotated |                 |
| output\_column\_name\_47kchpd    | Column name in the MAF file where the presence of variants in 47k CH-PD dataset is annotated   |                 |
| output\_column\_name\_hotspot    | Column name in the MAF file where presence of variants in hotspot dataset is annotated         |                 |

3. CH specific processing - where the MAF file from the above process is filtered and tagged, specifically for CH variants.

| **Parameter**            | **Description**                                          | **Default** |
| ------------------------ | -------------------------------------------------------- | ----------- |
| output\_maf\_name\_filer | Output MAF file name after filtering for CMO-CH criteria |             |
| output\_maf\_name\_tag   | Output MAF file name after tagging for CMO-CH criteria   |             |

Common workflow language execution engines accept two types of input that are [JSON](https://json.org) or [YAML](https://yaml.org), please make sure to use one of these while generating the input file. For more information refer to: [http://www.commonwl.org/user\_guide/yaml/](http://www.commonwl.org/user\_guide/yaml/)

## Example Input YML file to run the CWL&#x20;

```yaml
reference_fasta: 
 class: File
 path: >-
    /juno/work/access/production/resources/reference/current/Homo_sapiens_assembly19.fasta
bedfile:
  class: File
  path: >-
    /work/bergerm1/bergerlab/charalk/projects/nucleo_qc/qc_generation_testing/CH_target_3bp.bed
input_bam_case: 
  class: File
  path: >-
    /path/to/bam/file.bam
input_cosmicCountDB_vcf: 
  class: File
  path: >-
    /work/cch/production/resources/cosmic/versions/v96/CosmicCodingMuts.vcf.gz
input_cosmicprevalenceDB_vcf: 
  class: File
  path: >-
    /work/cch/production/resources/cosmic/versions/v96/CosmicCodingMuts_GRCh37_processed.vcf.gz
input_complexity_bed: 
  class: File
  path:  >-
    /work/bergerm1/bergerlab/sivaprk/chipvar_resources/rmsk_mod.bed
input_mappability_bed: 
  class: File
  path:  >-
    /work/bergerm1/bergerlab/sivaprk/chipvar_resources/wgEncodeDacMapabilityConsensusExcludable_4cols.bed
oncoKbApiToken: 
  class: File
  path:  >-
    /work/bergerm1/bergerlab/sivaprk/chipvar_resources/apiToken.txt
input_47kchpd_tsv_file: 
  class: File
  path: >-
    /work/bergerm1/bergerlab/sivaprk/chipvar_resources/chpd47k_prevalence.tsv
input_hotspot_tsv_file: 
  class: File
  path: >-
    /work/bergerm1/bergerlab/sivaprk/chipvar_resources/hotspots_47kchpd.tsv
input_panmeloid_tsv_file: 
  class: File
  path: >-
    /work/bergerm1/bergerlab/sivaprk/chipvar_resources/pan_myeloid_ks.tsv 
opOncoKbMafName: sampleName_oncokb.maf
output_complexity_filename: sampleName_complexity.maf
output_mappability_filename: sampleName_mappability.maf
output_vcf2mafName: sampleName_vcf2maf.maf
concat_output_name: sampleName_concat.vcf.gz
retain_info:  CNT,TUMOR_TYPE
sample_name: sampleName
vardict_allele_frequency_threshold: 0
vardict_output_vcf_name: sampleName_vardict.vcf
snpsift_countOpName: sampleName_snpsift_cosmic.vcf
snpsift_prevalOpName: sampleName_snpsift_preval.vcf
column_name_complexity: complexity
column_name_mappability: mapability
```



##
