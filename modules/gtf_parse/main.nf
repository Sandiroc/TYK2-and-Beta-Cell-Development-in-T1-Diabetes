#!/usr/bin/env nextflow

process PARSE_GTF {
    label 'process_low'
    container 'ghcr.io/bf528/pandas:latest'
    publishDir params.outdir, mode: 'copy'

    input:
    path gtf

    output:
    path("*.txt")

    shell:
    """
    python3 $projectDir/bin/gtf_parser.py -i $gtf -o gtf_parsed.txt
    """
}