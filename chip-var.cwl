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
    'sbg:y': 362.8125
  - id: input_bam_case
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 0
    'sbg:y': 469.75
  - id: bedfile
    type: File?
    'sbg:x': 0
    'sbg:y': 683.625
  - id: sample_name
    type: string
    'sbg:x': 250.328125
    'sbg:y': 320.8125
  - id: vardict_allele_frequency_threshold
    type: float?
    'sbg:x': 250.328125
    'sbg:y': 0
  - id: retain_info
    type: string?
    'sbg:x': 250.328125
    'sbg:y': 618.6875
  - id: concat_output_name
    type: string
    'sbg:x': 0
    'sbg:y': 576.6875
  - id: vardict_output_vcf_name
    type: string?
    'sbg:x': 0
    'sbg:y': 255.875
  - id: input_cosmicprevalenceDB_vcf
    type: File
    secondaryFiles:
      - .tbi
    'sbg:x': 250.328125
    'sbg:y': 832.5625
  - id: input_cosmicCountDB_vcf
    type: File
    secondaryFiles:
      - .tbi
    'sbg:x': 250.328125
    'sbg:y': 939.5
  - id: output_vcf2mafName
    type: string?
    'sbg:x': 250.328125
    'sbg:y': 725.625
  - id: snpsift_prevalOpName
    type: string?
    'sbg:x': 250.328125
    'sbg:y': 106.9375
  - id: snpsift_countOpName
    type: string?
    'sbg:x': 250.328125
    'sbg:y': 213.875
  - id: opOncoKbMafName
    type: string
    'sbg:x': 313.7685852050781
    'sbg:y': 1069.3170166015625
  - id: oncoKbApiToken
    type: File
    'sbg:x': 425.1004638671875
    'sbg:y': 1101.21533203125
  - id: oncoKbAnnotateHotspots
    type: boolean?
    'sbg:x': 525.1845092773438
    'sbg:y': 1227.406982421875
outputs:
  - id: vardict_txt
    outputSource:
      - run_processed_vardict/txt
    type: File
    'sbg:x': 595.7510375976562
    'sbg:y': 759.334716796875
  - id: cosmicCount_annotatedOutput
    outputSource:
      - variant_annotation/cosmicCount_annotatedOutput
    type: File
    'sbg:x': 1187.130126953125
    'sbg:y': 469.75
  - id: annotatedOutput_prevalence
    outputSource:
      - variant_annotation/annotatedOutput_prevalence
    type: File
    'sbg:x': 1187.130126953125
    'sbg:y': 576.6875
  - id: opOncoKbMaf
    outputSource:
      - variant_annotation/opOncoKbMaf
    type: File?
    'sbg:x': 1124.5281982421875
    'sbg:y': 326.3994445800781
  - id: concatenated_vcf
    outputSource:
      - run_processed_vardict/concatenated_vcf
    type: File
    'sbg:x': 710.38134765625
    'sbg:y': 731.8944091796875
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
    'sbg:x': 250.328125
    'sbg:y': 469.75
  - id: variant_annotation
    in:
      - id: input_cosmicCountDB_vcf
        source: input_cosmicCountDB_vcf
      - id: vardict_input_vcf
        source: run_processed_vardict/concatenated_vcf
      - id: input_cosmicprevalenceDB_vcf
        source: input_cosmicprevalenceDB_vcf
      - id: min_hom_vaf
        source: vardict_allele_frequency_threshold
      - id: output_mafName
        source: output_vcf2mafName
      - id: retain_info
        source: retain_info
      - id: tumor_id
        source: sample_name
      - id: snpsift_countOpName
        source: snpsift_countOpName
      - id: snpsift_prevalOpName
        source: snpsift_prevalOpName
      - id: opOncoKbMafName
        source: opOncoKbMafName
      - id: oncoKbApiToken
        source: oncoKbApiToken
      - id: oncoKbAnnotateHotspots
        source: oncoKbAnnotateHotspots
    out:
      - id: cosmicCount_annotatedOutput
      - id: annotatedOutput_prevalence
      - id: opOncoKbMaf
    run: subworkflows/variant_annotation/variant_annotation.cwl
    label: variant_annotation
    'sbg:x': 680.5020751953125
    'sbg:y': 360.28125
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
