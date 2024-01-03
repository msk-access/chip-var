# Requirements

## The following requirements need to be fulfilled before running the pipeline.&#x20;

* A system with either [docker](https://www.docker.com/) or [singularity](https://sylabs.io/docs/) configured.
* Python 3.6 and above (for running [cwltool](https://github.com/common-workflow-language/cwltool) and running [toil-cwl-runner](https://toil.readthedocs.io/en/latest/running/introduction.html))
  * Python Packages :
    * toil\[cwl]
    * cwltool
  * Python Virtual Environment using [virtualenv](https://virtualenv.pypa.io/) or [conda](https://docs.conda.io/en/latest/).
