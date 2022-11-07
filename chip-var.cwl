class: Workflow
cwlVersion: v1.0
id: chip_var
label: chip-var
$namespaces:
  s: 'https://schema.org/'
  sbg: 'https://www.sevenbridges.com/'
inputs:
  - id: reference_fasta
    type: File
    secondaryFiles:
      - .fai
    'sbg:x': 0
    'sbg:y': 255.59375
  - id: input_bam_case
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 0
    'sbg:y': 362.390625
  - id: input_cosmicprevalence_vcf
    type: File
    secondaryFiles:
      - .tbi
    'sbg:x': 250.34375
    'sbg:y': 617.984375
  - id: input_cosmicCount_vcf
    type: File
    secondaryFiles:
      - .tbi
    'sbg:x': 250
    'sbg:y': 722.6275024414062
  - id: bedfile
    type: File?
    'sbg:x': 0
    'sbg:y': 575.984375
  - id: sample_name
    type: string
    'sbg:x': 351.93536376953125
    'sbg:y': -68.43721008300781
  - id: vardict_allele_frequency_threshold
    type: float?
    'sbg:x': 43.350860595703125
    'sbg:y': -30.477481842041016
  - id: output_maf
    type: string?
    'sbg:x': 250.34375
    'sbg:y': 511.1875
  - id: retain_info
    type: string?
    'sbg:x': 250.34375
    'sbg:y': 404.390625
  - id: concat_output_name
    type: string
    'sbg:x': 0
    'sbg:y': 469.1875
  - id: vardict_output_vcf_name
    type: string?
    'sbg:x': 0
    'sbg:y': 148.796875
outputs:
  - id: txt
    outputSource:
      - run_processed_vardict/txt
    type: File
    'sbg:x': 618.2928466796875
    'sbg:y': 461.5052795410156
  - id: vcf2maf_maf
    outputSource:
      - variant_annotation/vcf2maf_maf
    type: File
    'sbg:x': 1161.72265625
    'sbg:y': 255.59375
  - id: cosmicCount_annotatedOutput
    outputSource:
      - variant_annotation/cosmicCount_annotatedOutput
    type: File
    'sbg:x': 1161.72265625
    'sbg:y': 362.390625
  - id: annotatedOutput_prevalence
    outputSource:
      - variant_annotation/annotatedOutput_prevalence
    type: File
    'sbg:x': 1161.72265625
    'sbg:y': 469.1875
steps:
  - id: run_processed_vardict
    in:
      - id: reference_fasta
        source: reference_fasta
      - id: input_bam_case
        source: input_bam_case
      - id: bedfile
        source: bedfile
      - id: sample_name
        source: sample_name
      - id: concat_output_name
        source: concat_output_name
      - id: stdout
        default: true
      - id: vardict_output_vcf_name
        source: vardict_output_vcf_name
      - id: vardict_allele_frequency_threshold
        source: vardict_allele_frequency_threshold
    out:
      - id: txt
      - id: concatenated_vcf
    run: subworkflows/vardict_workflow/run_processed_vardict.cwl
    label: run_processed_vardict.cwl
    'sbg:x': 250.34375
    'sbg:y': 255.59375
  - id: variant_annotation
    in:
      - id: input_cosmicCount_vcf
        source: input_cosmicCount_vcf
      - id: vardict_input_vcf
        source: run_processed_vardict/concatenated_vcf
      - id: input_cosmicprevalence_vcf
        source: input_cosmicprevalence_vcf
      - id: min_hom_vaf
        source: vardict_allele_frequency_threshold
      - id: output_maf
        source: output_maf
      - id: retain_info
        source: retain_info
      - id: tumor_id
        source: sample_name
      - id: ref_fasta
        source: reference_fasta
    out:
      - id: cosmicCount_annotatedOutput
      - id: annotatedOutput_prevalence
      - id: vcf2maf_maf
    run: subworkflows/variant_annotation/variant_annotation.cwl
    label: variant_annotation
    'sbg:x': 680.5177001953125
    'sbg:y': 259.9921875
requirements:
  - class: SubworkflowFeatureRequirement
$schemas:
  - 'http://schema.org/version/latest/schemaorg-current-http.rdf'
's:author':
  - class: 's:Person'
    's:email': 'mailto:sivaprk@mskcc.org'
    's:identifier': ''
    's:name': Karthigayini Sivaprakasam
's:citation': ''
's:codeRepository': 'https://github.com/msk-access/chip-var'
's:contributor':
  - class: 's:Person'
    's:email': 'mailto:sivaprk@mskcc.org'
    's:identifier': ''
    's:name': Karthigayini Sivaprakasam
  - class: 's:Person'
    's:email': 'mailto:shahr@mskcc.org'
    's:identifier': ''
    's:name': Ronak Shah
's:dateCreated': 2020-11-3
's:license': 'https://spdx.org/licenses/Apache-2.0'
