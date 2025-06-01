#!/usr/bin/env nextflow

process VERSE{
    label 'process_low'
    container 'ghcr.io/bf528/verse:latest'
    publishDir params.outdir, mode: 'copy'
    
    input: 
    tuple val(meta), path(bam)
    path(gtf)

    output:
    tuple val(meta), path("*exon.txt"), emit: counts
    path("*.exon.summary.txt"), emit: summary

    shell:
    """
    verse -S -a $gtf -o $meta $bam
    """
}
