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
    'sbg:y': 628.875
  - id: input_bam_case
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': 0
    'sbg:y': 735.5625
  - id: bedfile
    type: File?
    'sbg:x': 0
    'sbg:y': 948.9375
  - id: sample_name
    type: string
    'sbg:x': 250.328125
    'sbg:y': 320.0859375
  - id: vardict_allele_frequency_threshold
    type: float?
    'sbg:x': 250.328125
    'sbg:y': 0
  - id: retain_info
    type: string?
    'sbg:x': 250.328125
    'sbg:y': 617.4609375
  - id: concat_output_name
    type: string
    'sbg:x': 0
    'sbg:y': 842.25
  - id: vardict_output_vcf_name
    type: string?
    'sbg:x': 0
    'sbg:y': 522.1875
  - id: input_cosmicprevalenceDB_vcf
    type: File
    secondaryFiles:
      - .tbi
    'sbg:x': 250.328125
    'sbg:y': 1044.2578125
  - id: input_cosmicCountDB_vcf
    type: File
    secondaryFiles:
      - .tbi
    'sbg:x': 250.328125
    'sbg:y': 1150.9453125
  - id: snpsift_prevalOpName
    type: string?
    'sbg:x': 250.328125
    'sbg:y': 106.7109375
  - id: snpsift_countOpName
    type: string?
    'sbg:x': 250.328125
    'sbg:y': 213.3984375
  - id: input_DUST_bed
    type: File
    'sbg:x': 250.328125
    'sbg:y': 937.5703125
  - id: input_complexity_bed
    type: File
    'sbg:x': 250.328125
    'sbg:y': 1257.65625
  - id: output_DUST_filename
    type: string?
    'sbg:x': 250.328125
    'sbg:y': 724.1484375
  - id: column_name_DUST
    type: string?
    'sbg:x': 250.328125
    'sbg:y': 1364.3671875
  - id: output_complexity_filename
    type: string?
    'sbg:x': 250.328125
    'sbg:y': 830.859375
  - id: column_name_complexity
    type: string?
    'sbg:x': 250.328125
    'sbg:y': 1471.078125
  - id: oncoKbApiToken
    type: File
    'sbg:x': 521.0426025390625
    'sbg:y': 1303.28955078125
  - id: opOncoKbMafName
    type: string
    'sbg:x': 673.2667846679688
    'sbg:y': 1289.59326171875
  - id: output_vcf2mafName
    type: string?
    'sbg:x': 589.9828491210938
    'sbg:y': 1571.9603271484375
outputs:
  - id: vardict_txt
    outputSource:
      - run_processed_vardict/txt
    type: File
    'sbg:x': 843.761962890625
    'sbg:y': 1115.7548828125
  - id: vcf2maf_maf
    outputSource:
      - variant_annotation/vcf2maf_maf
    type: File
    'sbg:x': 1270.0546875
    'sbg:y': 522.1640625
  - id: cosmicCount_annotatedOutput
    outputSource:
      - variant_annotation/cosmicCount_annotatedOutput
    type: File
    'sbg:x': 1270.0546875
    'sbg:y': 842.2734375
  - id: annotatedOutput_prevalence
    outputSource:
      - variant_annotation/annotatedOutput_prevalence
    type: File
    'sbg:x': 1270.0546875
    'sbg:y': 948.9609375
  - id: output_DUST_maf
    outputSource:
      - variant_annotation/output
    type: File
    'sbg:x': 1270.0546875
    'sbg:y': 628.8515625
  - id: output_complexity_maf
    outputSource:
      - variant_annotation/output_complexity_maf
    type: File
    'sbg:x': 1270.0546875
    'sbg:y': 735.5625
  - id: concatenated_vcf
    outputSource:
      - run_processed_vardict/concatenated_vcf
    type: File
    'sbg:x': 669.528076171875
    'sbg:y': 130.18064880371094
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
    'sbg:y': 468.7734375
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
      - id: output_vcf2mafName
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
      - id: input_complexity_bed
        source: input_complexity_bed
      - id: input_DUST_bed
        source: input_DUST_bed
      - id: output_DUST_filename
        source: output_DUST_filename
      - id: column_name_DUST
        source: column_name_DUST
      - id: output_complexity_filename
        source: output_complexity_filename
      - id: column_name_complexity
        source: column_name_complexity
    out:
      - id: cosmicCount_annotatedOutput
      - id: annotatedOutput_prevalence
      - id: vcf2maf_maf
      - id: output
      - id: output_complexity_maf
    run: subworkflows/variant_annotation/variant_annotation.cwl
    label: variant_annotation
    'sbg:x': 757.078125
    'sbg:y': 648.4653930664062
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
