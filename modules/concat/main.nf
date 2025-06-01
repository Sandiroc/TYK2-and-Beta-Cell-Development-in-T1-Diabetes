#!/usr/bin/env nextflow

process CONCAT {
    container "ghcr.io/bf528/pandas:latest"
    label 'process_single'
    publishDir params.outdir, mode: 'copy'

    input:
    path(counts)

    output:
    path("*.csv")

    script:
    """
    concat.py -i ${counts.join(' ')} -o concat_counts.csv
    """

}