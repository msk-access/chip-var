# Inputs and Outputs

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



## List of Output Files

All the files are prefixed with the given Sample name.&#x20;

**Variant calling**&#x20;

* vardict\_STDFilter.txt&#x20;
* vardict\_concatenated.vcf&#x20;

**Annotation and tagging**

* cosmic\_count\_annotated.vcf&#x20;
* cosmic\_prevalence\_annotated.vcf&#x20;
* vcf2maf.maf&#x20;
* oncokb.maf&#x20;
* mapability.maf&#x20;
* complexity.maf&#x20;
* hotspot.maf&#x20;
* 47kchpd.maf&#x20;
* panmyeloid.maf&#x20;

**Filtering**&#x20;

* cmoch\_filtered.maf&#x20;
* cmoch\_tag.maf

sampleName\_cmoch\_tag.maf MAF file is the final file to use.
