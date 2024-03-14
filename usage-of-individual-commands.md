# Usage of individual commands

**Vardict v1.8.2**

<pre class="language-bash"><code class="lang-bash">/usr/bin/vardict/bin/VarDict -f "0" \
<strong>    -c "1" \
</strong>    -g "5" \
    -E "3" \
    -S "2" \
    -G /path/to/reference_fasta.ext \
    -N sample_name \
    -b /path/to/bam/file.bam \
    -bedfile /path/to/bedfile.ext \
    > vardict_app_output.vcf
</code></pre>

```
Rscript /usr/bin/vardict/bin/teststrandbias.R > output_teststrandbias.var \
    < /path/to/input_vardict.var
```

```perl
perl /usr/bin/vardict/bin/var2vcf_valid.pl \\
 -N sample_name
 -f 0
 > output_vcf_name
 < /path/to/input_vardict.var
```

**pv vardict v0.1.5**

```
pv vardict single filter -i /path/to/input_vardict.vcf \
    --tsampleName sample-name \
    -ad 1 \
    -fg false \
    -mq 0 \
    -tnr 1 \
    -dp 20 \
    -vf 5e-05 
```

**BCFTOOLS v 1.15.1**

**BGZIP**

<pre class="language-bash"><code class="lang-bash"><strong>bgzip -c /path/to/input_single_filter.vcf > sample_name.vcf.gz
</strong></code></pre>

**TABIX**

```bash
tabix -p vcf sample_name.vcf.gz 
```

**BCFTOOLS SORT**

```bash
#BCFTOOLS SORT
bcftools sort -O z -o sample_name_sorted.vcf.gz sample_name.vcf.gz
```

**BCFTOOLS NORM**

```bash
bcftools norm  --check-ref s \
  -m + \
  -O z \
  -o sample_name_norm.vcf.gz \
  -f /path/to/ref_fasta.fa \
  sample_name_sorted.vcf.gz
```

**BCFTOOLS CONCAT**

```bash
bcftools concat -a -O z \
  -o sample_name_merged.vcf \
  sample_name_sorted.vcf.gz sample_name_complex_sorted.vcf.gz
```

**SNPSIFT annotation v5.0:**

<pre class="language-java"><code class="lang-java">java -jar /snpEff/SnpSift.jar annotate -c snpeff.config \
<strong>/cosmicData/CosmicCodingMuts.vcf.gz sample_name_merged.vcf > sample_name_prevalence.vcf
</strong></code></pre>

**vcf2maf v1.6.21**

```perl
perl /opt/vcf2maf-1.6.21/vcf2maf.pl \
    --output-maf sample_name_vcf2maf.maf \
    --custom-enst /regions_of_interest/current/dmp_ACCESS-panelA-v1-isoform-overrides \
    -maf-center mskcc.org \
    --min-hom-vaf 0.7 \
    --ncbi-build GRCh37 \
    --ref-fasta /path/to/ref_fasta.fa \
    --retain-info "set,TYPE,FAILURE_REASON" \
    --species homo_sapiens_merged \
    --tumor-id sample_name \
    --vcf-tumor-id sample_name \
    --vep-path /usr/local/bin/ \
    --vep_data /.vep/ \
    --input-vcf sample_name_snpsift.vcf
```

**oncoKB annotator v3.2.2**

```python
python3 /oncokb/MafAnnotator.py -o sample_name_oncokb.maf \
    -b /path/to/API_toke.txt \
    -a TRUE \
    -i sample_name_vcf2maf.maf
```

**PV modules v0.2.3**

**MAF annotate by BED**

```
pv maf annotate mafbybed -m sample_name_oncokb.maf \
    -b /path/to/bed_file.bed \
    -c "column_name" \
    -o sample_name_mafbybed.maf
```

**MAF annotate by TSV**

```
pv maf annotate mafbytsv -m sample_name_mafbybed.maf \
    -b /path/to/tsv_file.tsv \
    -c "column_name" \
    -o sample_name_mafbytsv.maf
```

**MAF tag**

```
pv maf tag cmo_ch -m sample_name_mafbytsv.maf \
    -o sample_name_maf_tagged.maf
```

**MAF filter**

<pre><code><strong>pv maf filter cmo_ch -m sample_name_maf_tagged.maf \
</strong>    -o sample_name_maf_filter.maf
</code></pre>
