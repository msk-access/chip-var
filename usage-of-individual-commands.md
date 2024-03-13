# Usage of individual commands

**Part 1 :  Vairant Calling:** Variants are called from the BAM file using VARDICT tools and then a basic filtering is done. this VCF file is then processed to normalize, sort and concat both the complex and single variants.&#x20;

1. **VARDICT** : The vardict\_single\_sample.cwl runs the tools VarDict Java in single sample mode to call variants. It implements 3 workflows in turn - Vardict, test strand bias and conversion of var file to VCF format.  Detailed documentations can be found here : [https://github.com/AstraZeneca-NGS/VarDictJava#single-sample-mode](https://github.com/AstraZeneca-NGS/VarDictJava#single-sample-mode)

```
usage: vardict_single_sample.cwl [-h] [--bedfile BEDFILE]
                                 [--input_bam_control INPUT_BAM_CONTROL]
                                 [--input_bam_case INPUT_BAM_CASE]
                                 [--reference_fasta REFERENCE_FASTA]
                                 [--sample_name SAMPLE_NAME]
                                 [--bed_file_column_for_region_start BED_FILE_COLUMN_FOR_REGION_START]
                                 [--bed_file_column_for_region_end BED_FILE_COLUMN_FOR_REGION_END]
                                 [--bed_file_column_for_gene_name BED_FILE_COLUMN_FOR_GENE_NAME]
                                 [--bed_file_column_for_chromsome BED_FILE_COLUMN_FOR_CHROMSOME]
                                 [--control_sample_name CONTROL_SAMPLE_NAME]
                                 [--filter_variants]
                                 [--minimum_allele_frequency MINIMUM_ALLELE_FREQUENCY]
                                 [--output_vcf OUTPUT_VCF]
```

2. **pv\_vardict\_single\_sample\_filter** : This filters the resulting VCF file from the above VARDICT process based on allele depth, total depth, tumor-to-normal ratio, variant fraction and not filtering the germline variants.&#x20;

```
Usage: pv vardict single filter -h

Options:
  -i, --inputVcf FILE             Input vcf generated by vardict which needs
                                  to be processed  [required]
  --tsampleName TEXT              Name of the tumor Sample  [required]
  -dp, --totalDepth INTEGER RANGE
                                  Tumor total depth threshold  [default: 20;
                                  x>=20]
  -ad, --alleledepth INTEGER RANGE
                                  [x>=1]
  -tnr, --tnRatio INTEGER         Tumor-Normal variant fraction ratio
                                  threshold  [default: 1]
  -vf, --variantFraction FLOAT    Tumor variant fraction threshold  [default:
                                  5e-05]
  -mq, --minQual INTEGER          Minimum variant call quality  [default: 0]
  -fg, --filterGermline           Whether to remove calls without 'somatic'
                                  status
  -o, --outDir TEXT               Full Path to the output dir
  --help                          Show this message and exit.
```

3. **Variants Concat :** Variants concat made up of  three subprocess - sorting SNVs, sorting and normalizing complex variants and finally concatenating both the simple and complex variants. This subprocess includes commands from BCFTOOLS. The usage of every individual command are as follows:

<pre class="language-bash"><code class="lang-bash"><strong>#BGZIP
</strong><strong>usage: bcftools_bgzip_1.15.1.cwl [-h] 
</strong>  -h, --help      show this help message and exit
  --input INPUT   input VCF file
  
# TABIX
usage: bcftools_tabix_1.15.1.cwl [-h] 
  -h, --help     show this help message and exit
  --input INPUT  input VCF file
  
#BCFTOOLS SORT
usage: toil-cwl-runner bcftools_sort_1.15.1.cwl [-h]
  -h, --help             show this help message and exit
  --memory_per_job       Memory per job in megabytes
  --memory_overhead      Memory overhead per job in megabytes
  --number_of_threads    NUMBER_OF_THREADS
  --output_name          Output file name
  --output_type          Output file type -compressed BCF (b), uncompressed BCF (u), compressedVCF (z), uncompressed VCF (v)
  --input INPUT          input VCF files

#BCFTOOLS NORM
usage: toil-cwl-runner bcftools_norm_1.15.1.cwl [-h]
  -h, --help          show this help message and exit
  --memory_per_job    Memory per job in megabytes
  --memory_overhead   Memory overhead per job in megabytes
  --number_of_threads NUMBER_OF_THREADS
  --check_ref         CHECK_REF
  --multiallelics     use any
  --output_type       OUTPUT_TYPE
  --output_name       OUTPUT_NAME
  --input INPUT       input vcf file
  --fastaRef          Reference FASTA File
  
#BCFTOOLS CONCAT
usage: bcftools_concat_1.15.1.cwl [-h]
  -h, --help            show this help message and exit
  --memory_per_job      Memory per job in megabytes
  --memory_overhead     Memory overhead per job in megabytes
  --number_of_threads   NUMBER_OF_THREADS
  --allow_overlaps      First coordinate of the next file can precede last record of the current file.
  --output_name         Output file name
  --output_type         Output File Type compressed BCF (b), uncompressed BCF (u), compressedVCF (z), uncompressed VCF (v)
  --input               Input VCF File
</code></pre>

* **Sorting variants:** Simplex Single Nucleotide variants (SNVs) are sorted using BCFTOOLS. The process includes BGZIP, tabix, bcftools sort and tabix. The usage of individual tools and sorting subprocess is listed below.&#x20;

```bash
#Sorting workflow
usage: variant_sort.cwl [-h]
  -h, --help          show this help message and exit
  --input             INPUT
  --stdout
  --bgzip_output_name BGZIP_OUTPUT_NAME
  --preset            PRESET
  --output_type       OUTPUT_TYPE
  --sort_output_name  SORT_OUTPUT_NAME
```

* **Variants normalizing** - This sub-process normalizes the complex variants that are identified by VARDICT and filtered by the above filtering process. The variant file goes through a series of steps using BCFTOOLS -1.15.1. The series of steps includes BGZIP, TABIX,BCFTOOLS NORMA, BGZIP, BCFTOOLS SORT AND TABIX.

```shell
#Normaling Workflow
usage: variant_normalize_sort.cwl [-h]
  -h, --help            show this help message and exit
  --input               Input File
  --fastaRef            Reference FASTA File
  --stdout
  --bgzip_output_name   BGZIP_OUTPUT_NAME
  --preset              PRESET
  --output_type         OUTPUT_TYPE
  --norm_output_name    NORM_OUTPUT_NAME
  --multiallelics       MULTIALLELICS
  --check_ref           CHECK_REF
  --sort_output_name    SORT_OUTPUT_NAME
  --bgzip_output_directory BGZIP_OUTPUT_DIRECTORY
```

*   **Variants concatenation :** This subprocess concatenates both the complex and the simplex variants that are sorted and normalized. \


    ```shell
    #Concating workflow
    usage: variants_concat.cwl [-h] 
      -h, --help                  show this help message and exit
      --fastaRef                  Reference FASTA File
      --input                     INPUT
      --bgzip_output_name         BGZIP_OUTPUT_NAME
      --check_ref                 CHECK_REF
      --multiallelics             MULTIALLELICS
      --norm_output_name          NORM_OUTPUT_NAME
      --output_type               OUTPUT_TYPE
      --preset                    PRESET
      --sort_output_name          SORT_OUTPUT_NAME
      --complex_sort_output_name  COMPLEX_SORT_OUTPUT_NAME
      --complex_input             COMPLEX_INPUT
      --complex_bgzip_output_name COMPLEX_BGZIP_OUTPUT_NAME
      --output_name               OUTPUT_NAME
      --allow_overlaps
      --stdout
    ```

**Part 2: Variant Annotation** : This workflow includes a list of tools to annotate the processed variants from the above concatenation step.&#x20;

1. SNPSIFT annotation:
