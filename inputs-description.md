---
description: Input files and parameters required to run workflow
---

# Inputs Description

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
