---
description: Versions of tools in order of process
---

# Tools Description

| [VarDict](https://github.com/msk-access/cwl-commandlinetools/tree/develop/vardictjava/v1.8.2)                                                                                  | 1.8.2  |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------ |
| [Post Processing Variant - Single Sample FIlter](https://github.com/msk-access/cwl-commandlinetools/tree/develop/postprocessing\_variant\_calls/0.1.5)                         | 0.1.5  |
| [BCFtools - sort, normalize, bgzip, tabix](https://github.com/msk-access/cwl-commandlinetools/tree/develop/bcftools\_1.15.1)                                                   | 1.15.1 |
| [BCFtools - concat](https://github.com/msk-access/cwl-commandlinetools/tree/develop/bcftools\_1.6)                                                                             | 1.6    |
| [SnpSift - annotate](https://github.com/msk-access/cwl-commandlinetools/tree/develop/snpsift\_annotate\_5.0)                                                                   | 5.0    |
| [vcf2maf](https://github.com/msk-access/cwl-commandlinetools/tree/develop/vcf2maf\_1.6.21)                                                                                     | 1.6.21 |
| [OncoKB - annotator](https://github.com/msk-access/cwl-commandlinetools/tree/develop/oncokb\_annotator\_3.2.2)                                                                 | 3.2.2  |
| [Post Processing Variant - MAF annotated by BED](https://github.com/msk-access/cwl-commandlinetools/tree/develop/postprocessing\_variant\_calls/0.2.3/maf\_annotated\_by\_bed) | 0.2.3  |
| [Post Processing Variant - MAF annotated by TSV](https://github.com/msk-access/cwl-commandlinetools/tree/develop/postprocessing\_variant\_calls/0.2.3/maf\_annotated\_by\_tsv) | 0.2.3  |
| [Post Processing Variant - MAF tag](https://github.com/msk-access/cwl-commandlinetools/tree/develop/postprocessing\_variant\_calls/0.2.3/maf\_tag\_cmoch)                      | 0.2.3  |
| [Post Processing Variant - MAF filter](https://github.com/msk-access/cwl-commandlinetools/tree/develop/postprocessing\_variant\_calls/0.2.3/maf\_filter\_cmoch)                | 0.2.3  |

Files and Resources used

There are multiple files from different resources used in this workflow.&#x20;

| SnpSIFT annotate         | Cosmic V96   | 1. overall prevalence is obtained from CosmicCodingMuts.normal.vcf.gz (Note: normal denotes normalized ) 2. lineage prevalence was obtained by processing CosmicCodingMuts.vcf.gz |
| ------------------------ | ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| OncoKB annotate          | VEP 105      | API token File                                                                                                                                                                    |
| MAF annotated By BED/TSV |              |                                                                                                                                                                                   |
| Mappability BED File     | Ensembl HG19 | wgEncodeDacMapabilityConsensusExcludable.bed.gz                                                                                                                                   |
| Complexity BED File      | Ensembl HG19 | rmsk.txt.gz                                                                                                                                                                       |
| 47k CHPD TSV File        |              | 47K CH Putative Drivers list                                                                                                                                                      |
| Hotspot TSV File         |              | 47K CH PD variants with a prevalence >=5                                                                                                                                          |
| Panmyeloid TSV File      |              | Panmyeloid variants from IMPACT Haeme dataset                                                                                                                                     |
