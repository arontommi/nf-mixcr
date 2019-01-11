A simple run for mixcr on RNAseq data. It is inteded to run on Uppmax but should work on any slurm system

basic run:
nextflow run nf-mixcr/main.nf  -with-singularity mixcr.sif --reads '*_R{1,2}.fastq.gz'


