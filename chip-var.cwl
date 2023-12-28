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
    'sbg:x': -569.2681884765625
    'sbg:y': 540.0763549804688
  - id: input_bam_case
    type: File
    secondaryFiles:
      - ^.bai
    'sbg:x': -530.522216796875
    'sbg:y': 684.3321533203125
  - id: bedfile
    type: File?
    'sbg:x': -414.2841796875
    'sbg:y': 1055.296630859375
  - id: sample_name
    type: string
    'sbg:x': -170.2451171875
    'sbg:y': 54.73889923095703
  - id: vardict_allele_frequency_threshold
    type: float?
    'sbg:x': -343.1119079589844
    'sbg:y': -123.68433380126953
  - id: retain_info
    type: string?
    'sbg:x': 649.3818969726562
    'sbg:y': 552.9200439453125
  - id: concat_output_name
    type: string
    'sbg:x': -491.77618408203125
    'sbg:y': 903.0994873046875
  - id: vardict_output_vcf_name
    type: string?
    'sbg:x': -524.561279296875
    'sbg:y': 411.722900390625
  - id: input_cosmicprevalenceDB_vcf
    type: File
    secondaryFiles:
      - .tbi
    'sbg:x': 440.5188903808594
    'sbg:y': 1352.3375244140625
  - id: input_cosmicCountDB_vcf
    type: File
    secondaryFiles:
      - .tbi
    'sbg:x': 604.6749267578125
    'sbg:y': 1318.3961181640625
  - id: snpsift_prevalOpName
    type: string?
    'sbg:x': 706.0106811523438
    'sbg:y': 302.7104797363281
  - id: snpsift_countOpName
    type: string?
    'sbg:x': 643.4209594726562
    'sbg:y': 415.6714172363281
  - id: input_complexity_bed
    type: File
    'sbg:x': 786.4830932617188
    'sbg:y': 1292.7655029296875
  - id: output_complexity_filename
    type: string?
    'sbg:x': 489.92718505859375
    'sbg:y': 841.921875
  - id: column_name_complexity
    type: string?
    'sbg:x': 1119.881591796875
    'sbg:y': 1278.0843505859375
  - id: oncoKbApiToken
    type: File
    'sbg:x': 307.89697265625
    'sbg:y': 1131.6234130859375
  - id: opOncoKbMafName
    type: string
    'sbg:x': 404.7584228515625
    'sbg:y': 955.1882934570312
  - id: output_vcf2mafName
    type: string?
    'sbg:x': 560.6856079101562
    'sbg:y': 647.0568237304688
  - id: input_mappability_bed
    type: File
    'sbg:x': 358.5810241699219
    'sbg:y': 1200.3656005859375
  - id: output_mappability_filename
    type: string?
    'sbg:x': 424.7247009277344
    'sbg:y': 759.2913208007812
  - id: column_name_mappability
    type: string?
    'sbg:x': 1026.0533447265625
    'sbg:y': 1175.675048828125
  - id: input_47kchpd_tsv_file
    type: File
    'sbg:x': 951.6906127929688
    'sbg:y': 1005.534423828125
  - id: input_hotspot_tsv_file
    type: File
    'sbg:x': 465.3833312988281
    'sbg:y': 1213.544921875
  - id: input_panmeloid_tsv_file
    type: File
    'sbg:x': 259.5205993652344
    'sbg:y': 1023.4912109375
outputs:
  - id: vardict_txt
    outputSource:
      - run_processed_vardict/txt
    type: File
    'sbg:x': 197.73001098632812
    'sbg:y': 399.6891784667969
  - id: vcf2maf_maf
    outputSource:
      - variant_annotation/vcf2maf_maf
    type: File
    'sbg:x': 1471.18115234375
    'sbg:y': 220.9733428955078
  - id: cosmicCount_annotatedOutput
    outputSource:
      - variant_annotation/cosmicCount_annotatedOutput
    type: File
    'sbg:x': 1463.72998046875
    'sbg:y': 1165.380126953125
  - id: annotatedOutput_prevalence
    outputSource:
      - variant_annotation/annotatedOutput_prevalence
    type: File
    'sbg:x': 1415.20068359375
    'sbg:y': 1332.374755859375
  - id: output_complexity_maf
    outputSource:
      - variant_annotation/output_complexity_maf
    type: File
    'sbg:x': 1802.012451171875
    'sbg:y': 746.921875
  - id: concatenated_vcf
    outputSource:
      - run_processed_vardict/concatenated_vcf
    type: File
    'sbg:x': -20.976909637451172
    'sbg:y': 863.193603515625
  - id: vardict_output
    outputSource:
      - run_processed_vardict/vardict_output
    type: File
    'sbg:x': 68.44938659667969
    'sbg:y': 276
  - id: single_filter_vcf_complex
    outputSource:
      - run_processed_vardict/single_filter_vcf_complex
    type: File
    'sbg:x': 65.99111938476562
    'sbg:y': 442.17938232421875
  - id: single_filter_vcf
    outputSource:
      - run_processed_vardict/single_filter_vcf
    type: File
    'sbg:x': 55.47602462768555
    'sbg:y': 706.2611083984375
  - id: oncokb_maf
    outputSource:
      - variant_annotation/oncokb_maf
    type: File?
    'sbg:x': 1538.05859375
    'sbg:y': 1049.0994873046875
  - id: output_panmyeloid_maf
    outputSource:
      - variant_annotation/output_panmyeloid_maf
    type: File?
    'sbg:x': 1645.6021728515625
    'sbg:y': 275.59326171875
  - id: output_mapability_maf
    outputSource:
      - variant_annotation/output_mapability_maf
    type: File
    'sbg:x': 1666.519287109375
    'sbg:y': 438.503173828125
  - id: output_hotspot_maf
    outputSource:
      - variant_annotation/output_hotspot_maf
    type: File?
    'sbg:x': 1708.2457275390625
    'sbg:y': 586.0360717773438
  - id: output_47kchpd_maf
    outputSource:
      - variant_annotation/output_47kchpd_maf
    type: File?
    'sbg:x': 1866.210205078125
    'sbg:y': 910.9063720703125
  - id: output
    outputSource:
      - variant_annotation/output
    type: File
    'sbg:x': 1802.1302490234375
    'sbg:y': 1085.263427734375
  - id: output_maf_cmoch_tag
    outputSource:
      - chipvar_processing/output_maf_cmoch_tag
    type: File?
    'sbg:x': 2467.34423828125
    'sbg:y': 378.24853515625
  - id: output_maf_cmoch_filtered
    outputSource:
      - chipvar_processing/output_maf_cmoch_filtered
    type: File?
    'sbg:x': 2539.8486328125
    'sbg:y': 654.3231201171875
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
      - id: vardict_output
      - id: single_filter_vcf
      - id: single_filter_vcf_complex
    run: subworkflows/vardict_workflow/run_processed_vardict.cwl
    label: run_processed_vardict.cwl
    'sbg:x': -172.02841186523438
    'sbg:y': 400.01776123046875
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
      - id: input_mappability_bed
        source: input_mappability_bed
      - id: input_complexity_bed
        source: input_complexity_bed
      - id: output_mappability_filename
        source: output_mappability_filename
      - id: column_name_mappability
        source: column_name_mappability
      - id: output_complexity_filename
        source: output_complexity_filename
      - id: column_name_complexity
        source: column_name_complexity
      - id: input_hotspot_tsv_file
        source: input_hotspot_tsv_file
      - id: input_47kchpd_tsv_file
        source: input_47kchpd_tsv_file
      - id: input_panmeloid_tsv_file
        source: input_panmeloid_tsv_file
    out:
      - id: cosmicCount_annotatedOutput
      - id: annotatedOutput_prevalence
      - id: vcf2maf_maf
      - id: oncokb_maf
      - id: output_mapability_maf
      - id: output_complexity_maf
      - id: output
      - id: output_hotspot_maf
      - id: output_47kchpd_maf
      - id: output_panmyeloid_maf
    run: subworkflows/variant_annotation/variant_annotation.cwl
    label: variant_annotation
    'sbg:x': 1102.708740234375
    'sbg:y': 675.470703125
  - id: chipvar_processing
    in:
      - id: input_variant_annotated_maf
        source: variant_annotation/output_panmyeloid_maf
    out:
      - id: output_maf_cmoch_filtered
      - id: output_maf_cmoch_tag
    run: subworkflows/variant_annotation/chipvar_processing.cwl
    label: chipvar_processing
    'sbg:x': 2225.49560546875
    'sbg:y': 501.7513427734375
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
