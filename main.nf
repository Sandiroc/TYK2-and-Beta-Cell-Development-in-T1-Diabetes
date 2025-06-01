#!/usr/bin/env nextflow

include {FASTQC} from './modules/fastqc'
include {PARSE_GTF} from './modules/gtf_parse'
include {STAR} from './modules/star'
include {STAR_ALIGN} from './modules/star-alignment'
include {MULTIQC} from './modules/multiqc'
include {VERSE} from './modules/verse'
include {CONCAT} from './modules/concat'

workflow {
	Channel.fromFilePairs(params.reads)
	| set {align_ch}

	Channel.fromFilePairs(params.reads).transpose()
	| set {fastq_ch}


	/* FastQC Analysis*/
	FASTQC(fastq_ch)

	/* Parsed GTF */
	PARSE_GTF(params.gtf)

	/* Create STAR Index */
	STAR(params.genome, params.gtf)

	STAR_ALIGN(align_ch, STAR.out.index)

	FASTQC.out.zip.map{ it[1] }.collect()
	| set {fastqc_out}

	STAR_ALIGN.out.log.map{ it[1] }.collect()
	| set {star_log}

	fastqc_out.mix(star_log).flatten().collect()
	| set {multiqc_ch}

	MULTIQC(multiqc_ch)

	VERSE(STAR_ALIGN.out.bam, params.gtf)
	VERSE.out.counts.map{ it[1] }.collect().set{ concat_ch }

	//concat_ch.view()
	
	CONCAT(concat_ch)
}
