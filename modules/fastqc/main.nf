#!/usr/bin/env nextflow

process FASTQC{
    label 'process_high'
    container 'ghcr.io/bf528/fastqc:latest'
    publishDir params.outdir, mode: 'copy'

    input:
    tuple val(name), path(fastq_file)

    output:
    tuple val(name), path('*.zip'), emit: zip
    tuple val(name), path('*.html'), emit: html

    shell:
    """
    fastqc $fastq_file -t $task.cpus
    """

}