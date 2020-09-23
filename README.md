# nifH dada2
This is a nifH database formated for the dada2 pipeline. 

The database is based on the nifH ARB database from the Zehr Lab (Heller 2014) (version June 2017), which was exported from ARB in XML format. The XML file was modified, updated, and reformatted. A log of modifications can be found in this repository ([Taxonomic_modifications.pdf](https://github.com/moyn413/nifHdada2/blob/master/Taxonomic_modifications.pdf)). Modifications were based on information available on NCBI. 

## Database generation
The modified XML file included in this repository ([nifH_mod_v1.xml.zip](https://github.com/moyn413/nifHdada2/blob/master/XMLdatabase/nifH_mod_v1.xml.zip)) was used to generate a dada2 formatted database. The XML file contains detailed information for each entry, including accession number, full taxon name, taxonomy, amino acid and nucleotide sequences. The script for parsing data and generating the fasta file is also included in this repository ([nifH_xml_to_dada2_fasta.R](https://github.com/moyn413/nifHdada2/blob/master/XMLdatabase/nifH_xml_to_dada2_fasta.R)).

Taxonomy in the fasta file is in the following format:

> \>Domain; Phylum; Class; Order; Family; Genus
ACCTAGAAAGTCGTAGATCGAAGTTGAAGCATCGCCCGATGATCGTCTGAAGCTGTAGCATGAGTCGATTTTCACATTCAGGGATACCATAGGATAC

Three versions of the database are included: 
1. All sequences from the original nifH database ([nifH_dada2_all_v1.fasta](https://github.com/moyn413/nifHdada2/blob/master/nifH_dada2_all_v1.fasta))
2. Only sequences identified to the Domain level or more ([nifH_dada2_domain_v1.fasta](https://github.com/moyn413/nifHdada2/blob/master/nifH_dada2_domain_v1.fasta))
3. **Only sequences idetified to the Phylum level or more ([nifH_dada2_phylum_v1.fasta](https://github.com/moyn413/nifHdada2/blob/master/nifH_dada2_phylum_v1.fasta)) (**recommended version)

## Please cite
M. A. Moynihan. 2020. nifHdada2 GitHub repository. Zenodo. http://doi.org/10.5281/zenodo.3958370

<a href="https://zenodo.org/badge/latestdoi/281839441"><img src="https://zenodo.org/badge/281839441.svg" alt="DOI"></a>

## References
Heller, P., Tripp, H. J., Turk-Kubo, K., & Zehr, J. P. (2014). ARBitrator: A software pipeline for on-demand retrieval of auto-curated nifH sequences from GenBank. Bioinformatics, btu417.

ARB nifH database: https://wwwzehr.pmc.ucsc.edu/nifH_Database_Public/

NCBI Resource Coordinators. Database resources of the National Center for Biotechnology Information. Nucleic Acids Res. 2018;46(D1):D8-D13. doi:10.1093/nar/gkx1095
