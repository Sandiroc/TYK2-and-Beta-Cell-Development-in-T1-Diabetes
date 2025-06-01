#!/usr/bin/env nextflow

process STAR_ALIGN{
    label 'process_high'
    container 'ghcr.io/bf528/star:latest'
    publishDir params.outdir, mode: 'copy'

    input:
    tuple val(meta), path(reads)
    path(index)

    output:
    tuple val(meta), path("${meta}.Aligned.out.bam"), emit: bam
    tuple val(meta), path("${meta}.Log.final.out"), emit: log

    shell:
    """
    STAR --runThreadN $task.cpus --genomeDir $index --readFilesIn ${reads.join(" ")} --readFilesCommand gunzip -c --outFileNamePrefix ${meta}. --outSAMtype BAM Unsorted
    """
}