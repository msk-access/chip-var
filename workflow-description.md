# Workflow Description

CHIP-VAR workflow consists of multiple sub-workflows, written in Common Workflow Language (CWL). Figure 1 shows the complete pipeline grouped according to functionality.&#x20;

The 4 major steps in the order of working are&#x20;

1. Variant Calling,
2. Variant Annotation,
3. Filtering and&#x20;
4. Tagging.&#x20;

The pipeline is run for every sample in a project and finally, the results from all the samples in a particular project are then combined to further filter for artifacts and likely germline variants.&#x20;

This set of variants is then marked as either High Confidence \[HC] CH-PD \[CH Putative Driver mutations] or non-CH-PD based on the conditions listed in the white boxes.&#x20;

<figure><img src=".gitbook/assets/image (1).png" alt=""><figcaption><p>Figure 1: CHIP-VAR PIPELINE</p></figcaption></figure>

{% hint style="info" %}
The bottom light pink box in the above image elaborates on the variant calling workflow using the VarDictJava tool as it involves calling, sorting, normalizing, and concatenating the complex and normal, variant VCF files.&#x20;
{% endhint %}

