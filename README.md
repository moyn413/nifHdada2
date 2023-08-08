# nifH dada2 (v2)
This is a nifH database formatted for the dada2 pipeline originally released as v1.1.0 (2020) and since updated to v2.0.5 (2023). 

In v2.0.5, taxonomy has been updated according to changes on NCBI. Additional sequences were added using Arbitrator 2023 to identify newly published nifH between 2017 and 2023, as well as from an NCD catalogue published by (Turk-Kubo et al. 2022).

The original database is based on the nifH ARB database from the Zehr Lab (Heller et al. 2014) (version June 2017), which was exported from ARB in XML format. The XML file was modified, updated, and reformatted and additional sequences were added, including nifH homologs from Cluster V (chlL/bchL)  (see [v1.1.0](https://github.com/moyn413/nifHdada2/tree/master/v1.1.0/Documentation) folder for detail). 


## Database information

Taxonomy in the fasta file is in the following format:

> \>Domain; Phylum; Class; Order; Family; Genus
ACCTAGAAAGTCGTAGATCGAAGTTGAAGCATCGCCCGATGATCGTCTGAAGCTGTAGCATGAGTCGATTTTCACATTCAGGGATACCATAGGATAC

[nifH_dada2_phylum_v2.0.5.fasta](https://github.com/moyn413/nifHdada2/blob/master/nifH_dada2_phylum_v2.0.5.fasta) only includes sequences that have been identified to the phylum level or more. 

When assigning taxonomy, set minBoot = 0 and outputBootstraps = TRUE. Bootstrap filtering can then be performed after taxonomic assignment.


## Please cite

###v2.0.5
M. A. Moynihan & C. Furbo Reeder 2023. nifHdada2 GitHub repository, v2.0.5. Zenodo. (insert link)

(insert link)

###v1.1.0

M. A. Moynihan. 2020. nifHdada2 GitHub repository. Zenodo. http://doi.org/10.5281/zenodo.3958370

<a href="https://zenodo.org/badge/latestdoi/281839441"><img src="https://zenodo.org/badge/281839441.svg" alt="DOI"></a>

## References

ARB nifH database: https://wwwzehr.pmc.ucsc.edu/nifH_Database_Public/

Heller, P., Tripp, H. J., Turk-Kubo, K., & Zehr, J. P. (2014). ARBitrator: A software pipeline for on-demand retrieval of auto-curated nifH sequences from GenBank. Bioinformatics, btu417.

Schvarcz, C.R., Wilson, S.T., Caffin, M. et al. (2022) Overlooked and widespread pennate diatom-diazotroph symbioses in the sea. Nat Commun 13, 799.

Turk-Kubo, K. A., Gradoville, M. R., Cheung, S., Cornejo-Castillo, F. M., Harding, K. J., Morando, M., ... & Zehr, J. P. (2022). Non-cyanobacterial diazotrophs: Global diversity, distribution, ecophysiology, and activity in marine waters. FEMS microbiology reviews, fuac046. (and references therein)

Méheust, R., Castelle, C. J., Matheus Carnevali, P. B., Farag, I. F., He, C., Chen, L. X., ... & Banfield, J. F. (2020). Groundwater Elusimicrobia are metabolically diverse compared to gut microbiome Elusimicrobia and some have a novel nitrogenase paralog. The ISME journal, 14(12), 2907-2922.

Schvarcz, C. R., Wilson, S. T., Caffin, M., Stancheva, R., Li, Q., Turk-Kubo, K. A., ... & Steward, G. F. (2022). Overlooked and widespread pennate diatom-diazotroph symbioses in the sea. Nature communications, 13(1), 799.

NCBI Resource Coordinators. Database resources of the National Center for Biotechnology Information. Nucleic Acids Res. 2018;46(D1):D8-D13. doi:10.1093/nar/gkx1095


## Acknowledgements 
We acknowledge support from Simons Foundation (Award#: 824763), NOTION by BNP Paribas Fundation for Climate and Biodiversity, MANIOC by Aix-Marseille University, and DINDE by CEFIPRA. We thank Jonathan Magasin for helpful discussions.