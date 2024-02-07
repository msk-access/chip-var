---
description: >-
  If you have paired-end umi-tagged fastqs, you can run the ACCESS fastq to bam
  workflow with the following steps
---

# Installation and Usage

## Step 1: Create a virtual environment.

### Option (A) - if using cwltool

If you are using cwltool only, please proceed using python 3.9 as done below:

Here we can use either [virtualenv](https://virtualenv.pypa.io/) or [conda](https://docs.conda.io/en/latest/). Here we will use conda.

<pre class="language-sh"><code class="lang-sh"><strong>#python3-conda-virtualenv
</strong>conda create --name my_project python=3.9
conda activate my_project
</code></pre>

### Option (B) - recommended for Juno HPC cluster

If you are using toil, python 3 is required. Please install using Python 3.9 as done below:

Here we can use either [virtualenv](https://virtualenv.pypa.io/) or [conda](https://docs.conda.io/en/latest/). Here we will use conda.

```sh
#python3-conda-virtualenv
conda create --name my_project python=3.9
conda activate my_project
```

{% hint style="info" %}
Once you execute the above command you will see your bash prompt something on this lines:

```bash
#bash-prompt-example
(my_project)[server]$
```
{% endhint %}

## Step 2: Clone the repository

{% code title="git-clone-with-submodule" %}
```bash
git clone --recursive --branch 3.0.4 https://github.com/msk-access/chip-var.git
```
{% endcode %}

{% hint style="info" %}
**Note:** Change 3.0.4 to the latest stable release of the pipeline
{% endhint %}

## Step 3: Install requirements using pip

We have already specified the version of cwltool and other packages in the requirements.txt file. Please use this to install.

{% code title="python-package-installation-using-pip" %}
```bash
#python3
cd chip-var
pip3 install -r requirements.txt
```
{% endcode %}

## Step 4: Check if you have singularity and nodejs for HPC

For HPC normally singularity is used for containers. Thus please make sure that is installed. For JUNO, you can do the following:

{% code title="load-singularity-on-juno" %}
```bash
module load singularity
```
{% endcode %}

We also need to make sure nodejs is installed, this can be installed using conda:

<pre class="language-shell" data-title="conda-install-nodejs"><code class="lang-shell"><strong>conda install -c conda-forge nodejs
</strong></code></pre>

## Step 5: Generate an inputs file

Next, you must generate a proper input file in either [json](https://www.json.org/) or [yaml](https://yaml.org/) format.

For details on how to create this file, please follow this example (there is a minimal example of what needs to be filled in at the end of the page):

[Input Description](inputs-description.md)

It's also possible to create and fill in a "template" inputs file using this command:

```
$ cwltool --make-template chip-var.cwl > inputs.yaml
```

{% hint style="warning" %}
This may or may not work. We are not exactly sure why. But you can always use Rabix to generate the template input
{% endhint %}

{% hint style="info" %}
Note: To see help for the inputs for cwl workflow you can use: `toil-cwl-runner chip-var.cwl --help`
{% endhint %}

Once we have successfully installed the requirements we can now run the workflow using _cwltool/toil_ .

## Step 6: Run the workflow



{% tabs %}
{% tab title="Using cwltool" %}
Here we show how to use [cwltool](https://github.com/common-workflow-language/cwltool) to run the workflow on a single machine, such as a laptop

#### Run the workflow with a given set of input using [cwltool](https://github.com/common-workflow-language/cwltool) on single machine

{% code title="cwltool-execution" %}
```bash
cwltool chip-var.cwl inputs.yaml
```
{% endcode %}
{% endtab %}

{% tab title="Using toil-cwl-runner locally" %}
Here we show how to run the workflow using [toil-cwl-runner](https://toil.readthedocs.io/en/latest/running/introduction.html) using single machine interface

Once we have successfully installed the requirements we can now run the workflow using _cwltool_ if you have proper input file generated either in [json](https://www.json.org/) or [yaml](https://yaml.org/) format. Please look at [Inputs Description](broken-reference) for more details.

#### Run the workflow with a given set of input using [toil](https://toil.readthedocs.io/en/latest/running/introduction.html) on single machine

{% code title="toil-local-execution" %}
```bash
toil-cwl-runner chip-var.cwl inputs.yaml
```
{% endcode %}
{% endtab %}

{% tab title="Using toil-cwl-runner on JUNO" %}
Here we show how to run the workflow using [toil-cwl-runner](https://toil.readthedocs.io/en/latest/running/introduction.html) on MSKCC internal compute cluster called JUNO which has [IBM LSF](https://www.ibm.com/support/knowledgecenter/en/SSETD4/product\_welcome\_platform\_lsf.html) as a scheduler.

Note the use of `--singularity`to convert Docker containers into singularity containers, the `TMPDIR` environment variable to avoid writing temporary files to shared disk space, the `_JAVA_OPTIONS` environment variable to specify java temporary directory to `/scratch`, using `SINGULARITY_BINDPATH` environment variable to bind the `/scratch` when running singularity containers and `TOIl_LSF_ARGS` to specify any additional arguments to `bsub`commands that the jobs should have (in this case, setting a max wall-time of 6 hours).

Run the workflow with a given set of input using [toil](https://toil.readthedocs.io/en/latest/running/introduction.html) on JUNO (MSKCC Research Cluster)

{% code title="toil-lsf-execution" %}
```bash
TMPDIR=$PWD
TOIL_LSF_ARGS='-W 3600 -P test_nucleo -app anyOS -R select[type==CentOS7]'
_JAVA_OPTIONS='-Djava.io.tmpdir=/scratch/'
SINGULARITY_BINDPATH='/scratch:/scratch:rw'
toil-cwl-runner \
       --singularity \
       --logFile ./example.log  \
       --jobStore ./example_jobStore \
       --batchSystem lsf \
       --workDir ./example_working_directory/ \
       --outdir $PWD \
       --writeLogs ./example_log_folder/ \
       --logLevel DEBUG \
       --stats \
       --retryCount 2 \
       --disableCaching \
       --disableChaining \
       --preserve-environment TOIL_LSF_ARGS TMPDIR \
       --maxLogFileSize 20000000000 \
       --cleanWorkDir onSuccess \
       chip-var.cwl \
       inputs.yaml \
       > toil.stdout \
       2> toil.stderr &
```
{% endcode %}
{% endtab %}
{% endtabs %}

## Usage

```
usage: chip-var.cwl [-h] --reference_fasta REFERENCE_FASTA --input_bam_case INPUT_BAM_CASE
                    [--bedfile BEDFILE] --sample_name SAMPLE_NAME
                    [--vardict_allele_frequency_threshold VARDICT_ALLELE_FREQUENCY_THRESHOLD]
                    [--retain_info RETAIN_INFO] --concat_output_name CONCAT_OUTPUT_NAME
                    [--vardict_output_vcf_name VARDICT_OUTPUT_VCF_NAME]
                    --input_cosmicprevalenceDB_vcf INPUT_COSMICPREVALENCEDB_VCF
                    --input_cosmicCountDB_vcf INPUT_COSMICCOUNTDB_VCF
                    [--snpsift_prevalOpName SNPSIFT_PREVALOPNAME]
                    [--snpsift_countOpName SNPSIFT_COUNTOPNAME] --input_complexity_bed
                    INPUT_COMPLEXITY_BED
                    [--output_complexity_filename OUTPUT_COMPLEXITY_FILENAME]
                    [--column_name_complexity COLUMN_NAME_COMPLEXITY] --oncoKbApiToken
                    ONCOKBAPITOKEN --opOncoKbMafName OPONCOKBMAFNAME
                    [--output_vcf2mafName OUTPUT_VCF2MAFNAME] --input_mappability_bed
                    INPUT_MAPPABILITY_BED
                    [--output_mappability_filename OUTPUT_MAPPABILITY_FILENAME]
                    [--column_name_mappability COLUMN_NAME_MAPPABILITY]
                    --input_47kchpd_tsv_file INPUT_47KCHPD_TSV_FILE --input_hotspot_tsv_file
                    INPUT_HOTSPOT_TSV_FILE --input_panmeloid_tsv_file INPUT_PANMELOID_TSV_FILE
                    [job_order]

chip-var

positional arguments:
  job_order             Job input json file

options:
  -h, --help            show this help message and exit
  --reference_fasta REFERENCE_FASTA
  --input_bam_case INPUT_BAM_CASE
  --bedfile BEDFILE
  --sample_name SAMPLE_NAME
  --vardict_allele_frequency_threshold VARDICT_ALLELE_FREQUENCY_THRESHOLD
  --retain_info RETAIN_INFO
  --concat_output_name CONCAT_OUTPUT_NAME
  --vardict_output_vcf_name VARDICT_OUTPUT_VCF_NAME
  --input_cosmicprevalenceDB_vcf INPUT_COSMICPREVALENCEDB_VCF
  --input_cosmicCountDB_vcf INPUT_COSMICCOUNTDB_VCF
  --snpsift_prevalOpName SNPSIFT_PREVALOPNAME
  --snpsift_countOpName SNPSIFT_COUNTOPNAME
  --input_complexity_bed INPUT_COMPLEXITY_BED
  --output_complexity_filename OUTPUT_COMPLEXITY_FILENAME
  --column_name_complexity COLUMN_NAME_COMPLEXITY
  --oncoKbApiToken ONCOKBAPITOKEN
  --opOncoKbMafName OPONCOKBMAFNAME
  --output_vcf2mafName OUTPUT_VCF2MAFNAME
  --input_mappability_bed INPUT_MAPPABILITY_BED
  --output_mappability_filename OUTPUT_MAPPABILITY_FILENAME
  --column_name_mappability COLUMN_NAME_MAPPABILITY
  --input_47kchpd_tsv_file INPUT_47KCHPD_TSV_FILE
  --input_hotspot_tsv_file INPUT_HOTSPOT_TSV_FILE
  --input_panmeloid_tsv_file INPUT_PANMELOID_TSV_FILE
```
