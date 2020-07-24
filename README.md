# nifHdada2
This is a nifH database formated for dada2. 

The database is based on the ARB nifH database from the Zehr Lab (Heller 2014), which was reformatted, modified, and updated. 
A log of modifications can be found in this repository (Taxonomic_modifications.pdf). Modifications were based on information available on NCBI. 

# Database generation
Modifications were made directly in an XML file exported from ARB (nifH2017_mod_v1.xml.zip). The XML file contains detailed information for each entry, including accession number, full taxon name, taxonomy, amino acid and nucleotide sequences.

The fasta formatted database for dada2 was generated from the modified XML file. The script for parsing data and generating the fasta file is included in this repository (nifH_xml_to_dada2_fasta.R).

Taxonomy in the fasta file is in the following format:

> \>Domain; Phylum; Class; Order; Family; Genus
ACCTAGAAAGTCGTAGATCGAAGTTGAAGCATCGCCCGATGATCGTCTGAAGCTGTAGCATGAGTCGATTTTCACATTCAGGGATACCATAGGATAC

Three versions of the database are included: 
1. All sequences from the original nifH database (nifH2017_dada2_all.fasta)
2. Only sequences identified to the Domain level or more (nifH2017_dada2_domain.fasta)
3. Only sequences idetified to the Phylum level or more (nifH2017_dada2_phylum.fasta)

# Please cite
M. A. Moynihan ... DOI.


# References
Heller, P., Tripp, H. J., Turk-Kubo, K., & Zehr, J. P. (2014). ARBitrator: A software pipeline for on-demand retrieval of auto-curated nifH sequences from GenBank. Bioinformatics, btu417.

ARB nifH database: https://wwwzehr.pmc.ucsc.edu/nifH_Database_Public/

NCBI Resource Coordinators. Database resources of the National Center for Biotechnology Information. Nucleic Acids Res. 2018;46(D1):D8-D13. doi:10.1093/nar/gkx1095
