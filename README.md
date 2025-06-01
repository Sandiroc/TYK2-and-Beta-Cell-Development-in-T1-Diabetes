## Overview
This project reproduces and extends transcriptomics analysis from the study **"The type 1 diabetes gene TYK2 regulates β-cell development and its responses to interferon-α"** by **Chandra et al., 2022** ([Nature Communications, PMID: 36253452](https://www.nature.com/articles/s41467-022-34069-z)).

This pipeline was built to evaluate the impact of TYK2 knockout on β-cell differentiation and overall immune response by analyzing bulk RNA-seq data from the study's associated GEO repository (GSE213634).

The TYK2 gene is a known susceptibility marker for type 1 diabetes. Chandra et al. demonstrate that TYK2 influences β-cell maturation and the transcriptional response to interferon-α (IFN-α), a key inflammatory cytokine implicated in onset type 1 diabetes. This pipeline aims to:

- Reproduce and visualize the core differential gene expression (DGE) results from the study.
- Validate the disruption of antigen presentation pathways (e.g., MHC Class I, PSMB subunits) in TYK2 knockout cells treated with IFN-α.
- Provide modular & reproducible analysis that supports hypothesis-driven exploration of β-cell immunogenicity in type 1 diabetes.

## Data

- **Study Accession:** [GSE190727](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE190727)   and [GSE190725](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE190725)
- **Format:** Raw read counts (bulk RNA-seq)  
- **Conditions:** WT vs TYK2 KO, with and without IFN-α treatment across multiple timepoints.

## Citation

Original study:

> Chandra, V., Alenkhar, A. R., Rajashekar, B., et al. (2022).  
> *The type 1 diabetes gene TYK2 regulates β-cell development and its responses to interferon-α.*  
> Nature Communications, 13, 6161. https://doi.org/10.1038/s41467-022-34069-z