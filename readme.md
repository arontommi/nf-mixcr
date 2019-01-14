
A simple [nextflow](https://www.nextflow.io/) run for [mixcr](https://github.com/milaboratory/mixcr) on RNAseq data to estimate TCR and IG repertoires. It is inteded to run on Uppmax but should work on any slurm system

to get the singularity image for the run simply collect it from the docker image hosted on dockerhub : 

``` 
singularity pull docker://milaboratory/mixcr
```

```
basic run:
nextflow run nf-mixcr/main.nf  -with-singularity mixcr.sif --reads '*_R{1,2}.fastq.gz'

```
