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
    'sbg:x': -562.599365234375
    'sbg:y': -212.5
  - id: input_bam_case
    type: File
    'sbg:x': -517.599365234375
    'sbg:y': -39.5
  - id: input_cosmicprevalence_vcf
    type: File
    'sbg:x': -217.59912109375
    'sbg:y': 186.5
  - id: input_cosmicCount_vcf
    type: File
    'sbg:x': -85.59912109375
    'sbg:y': 420.499267578125
  - id: bedfile
    type: File?
    'sbg:x': -625.6339721679688
    'sbg:y': -111.44763946533203
  - id: sample_name
    type: string
    'sbg:x': -473.7927551269531
    'sbg:y': -336.8258361816406
  - id: vardict_allele_frequency_threshold
    type: float?
    'sbg:x': -611.3988647460938
    'sbg:y': -295.3067626953125
  - id: output_maf
    type: string?
    'sbg:x': -338.9090270996094
    'sbg:y': 102.78582000732422
  - id: retain_info
    type: string?
    'sbg:x': -16.10749053955078
    'sbg:y': 13.191929817199707
  - id: concat_output_name
    type: string
    'sbg:x': -678.8388061523438
    'sbg:y': -10.524100303649902
  - id: ref_fasta
    type: File?
    'sbg:x': -485.09576416015625
    'sbg:y': 476.9649658203125
outputs:
  - id: txt
    outputSource:
      - run_processed_vardict/txt
    type: File
    'sbg:x': -249.59933471679688
    'sbg:y': -250.5
  - id: vcf2maf_maf
    outputSource:
      - variant_annotation/vcf2maf_maf
    type: File
    'sbg:x': 312.40087890625
    'sbg:y': 44.4992790222168
  - id: cosmicCount_annotatedOutput
    outputSource:
      - variant_annotation/cosmicCount_annotatedOutput
    type: File
    'sbg:x': 419.40087890625
    'sbg:y': 185.49928283691406
  - id: annotatedOutput_prevalence
    outputSource:
      - variant_annotation/annotatedOutput_prevalence
    type: File
    'sbg:x': 282.40087890625
    'sbg:y': 340.4985656738281
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
      - id: vardict_allele_frequency_threshold
        source: vardict_allele_frequency_threshold
    out:
      - id: txt
      - id: concatenated_vcf
    run: subworkflows/vardict_workflow/run_processed_vardict.cwl
    label: run_processed_vardict.cwl
    'sbg:x': -377.6015625
    'sbg:y': -153.5
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
        source: ref_fasta
    out:
      - id: cosmicCount_annotatedOutput
      - id: annotatedOutput_prevalence
      - id: vcf2maf_maf
    run: subworkflows/variant_annotation/variant_annotation.cwl
    label: variant_annotation
    'sbg:x': 174.40066528320312
    'sbg:y': 187.5
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
