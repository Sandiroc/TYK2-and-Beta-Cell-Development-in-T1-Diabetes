#!/usr/bin/env nextflow

process STAR {
    label 'process_high'
    container 'ghcr.io/bf528/star:latest'

    input:
    path(genome)
    path(gtf)

    output:
    path "star", emit: index

    shell:
    """
    echo "Number of CPUs allocated: $task.cpus"
    mkdir star
    STAR --runThreadN $task.cpus --runMode genomeGenerate --genomeDir star --genomeFastaFiles $genome --sjdbGTFfile $gtf
    """
}