#!/usr/bin/env nextflow

params.reads = false
params.project = false 


Channel
    .fromFilePairs(params.reads)
    .ifEmpty { exit 1, "params.reads was empty - no input files supplied" }
    .set{ raw_reads }

process mixcr {
	publishDir "results/mixcr_output", mode: 'copy' 

	output:
	file "${name}_clones_exported.txt" into clones 

	input:
	set val(name), file(reads) from raw_reads

	script:
	"""
	mixcr align \
		--species hs \
		-p kaligner2 \
		--report report.txt \
		$reads \
		alignments.vdjca \
		-f  \
		-t 16

	mixcr assemble alignments.vdjca clones.clns

	mixcr exportClones clones.clns ${name}_clones_exported.txt
	"""
}