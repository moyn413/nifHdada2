library(XML)
library(xml2)
library(methods)
library(tibble)
library(stringr)
library(plyr)
library(dplyr)
library(seqinr)


setwd("/Users/path to working directory for fasta output/")

##------------------Import and parse file-----------------------------------------
## Extract nodes from XML file using xpathSApply. In the XML file each parent node 
## (\<species\>) has multiple child nodes, which contain the information we want. 
## So that rows are not misaligned when the dataframe is created, it is important to 
## check that all parent nodes contain all desired child nodes. This can be done by 
## checking the length of the character strings generated during parsing. More details 
## on this can be found at the end of the script. In the XML file uploaded in this 
## repository, this has already been checked.
##---------------------------------------------------------------------------------


nifH <- xmlParse(file = "/pathtoxmlfile/nifH2017_mod_v1.xml")

name <- xpathSApply(nifH,"//full_taxon_name",xmlValue)  # taxon name
tax <- xpathSApply(nifH,"//tax",xmlValue)               # taxonomy
acc <- xpathSApply(nifH,"//acc",xmlValue)               # accession number
seq <- xpathSApply(nifH,"//data",xmlValue)              # sequence

# make sequences all caps
seq <- toupper(seq)   

# bind into tibble
df=cbind(name,tax,acc,seq)
df=as_tibble(df)


##------------------Clean up XML file text-----------------------------------------
## Remove all parentheses, dashes, quotes, etc. from the name and tax columns. 
## To format the database for dada2, we need the taxonomy to begin with the Domain, 
## however the taxonomy from ARB begins with the full taxon name, see below: 
##    <full_taxon_name>Sinorhizobium fredii (Rhizobium fredii)</full_taxon_name>
##    <tax>Sinorhizobium fredii Bacteria; Proteobacteria; Alphaproteobacteria; Rhizobiales; Rhizobiaceae; Sinorhizobium; environmental samples.</tax>
## Because the full taxon name matches with the beginning of the taxonomy, we can essentially 
## subtract the taxon name from the taxonomy. However, it is important that these be an exact match. 
## The end result will have the following format. 
##    <tax>Bacteria; Proteobacteria; Alphaproteobacteria; Rhizobiales; Rhizobiaceae; Sinorhizobium;</tax>
##---------------------------------------------------------------------------------


# Removes both the parentheses and what is inside of the parentheses (usually alternative species name). This helps ensure that the name and tax columns match exactly.

df1 <-df %>%  mutate_at(c("name", "tax"), str_replace_all, pattern= "\\(.*\\)", replacement="")      

# Remove the following characters: +, ', [ ], -, =

df1 <- df1 %>%  mutate_at(c("name", "tax"), str_replace_all, pattern= "\\+|\\'|\\[|\\=|\\]|\\-" ,replacement="")

# Remove the taxon name from beginning taxonomy column.

df2 <- df1 %>% mutate(tax= str_replace(df1$tax, df1$name, "") %>% str_trim() )

# Remove "environmental samples." from end of taxonomy. 

df3 <- df2 %>% mutate(tax= str_replace(df2$tax, "environmental samples.", "") %>% str_trim() ) 

# The end of the tax entry in the XML file is a period, but for dada2 we want a semicolon.

df4 <- df3 %>% mutate(tax= str_replace_all(df3$tax, "\\.", "\\;") %>% str_trim() )   


##------------------Remove unclassified samples-----------------------------------------
## Remove rows with "other sequences; artificial sequences;" or "other sequences; artificial sequences; 
## vectors;", or "unclassified sequences;"
## Remove sequences that are only classified at the Domain level (e.g. Bacteria, Archaea)
##---------------------------------------------------------------------------------


df5 <- df4 %>% filter(!tax %in% c("other sequences; artificial sequences;", "unclassified sequences;", "other sequences; artificial sequences; vectors;"))

df6 <- df5 %>% filter(!tax %in% c("Bacteria;", "Archaea;"))


##------------------Write to fasta format and csv----------------------------------

writeFasta<-function(data, filename){
  fastaLines = c()[1]
  for (rowNum in 1:nrow(data)){
    fastaLines = c(fastaLines, as.character(paste(">", data[rowNum,"tax"], sep = "")))
    fastaLines = c(fastaLines,as.character(data[rowNum,"seq"]))
  }
  fileConn<-file(filename)
  writeLines(fastaLines, fileConn)
  close(fileConn)
}


#all data from file, including unclassified samples

writeFasta(df4, "nifH_dada2_all.fasta")

write.csv(df4, "nifH_dada2_all.csv")

#files only Domain classification or more for each sequence

writeFasta(df5, "nifH_dada2_domain.fasta")

write.csv(df5, "nifH_dada2_domain.csv")


#files only Phylum classification or more for each sequence

writeFasta(df6, "nifH_dada2_phylum.fasta")

write.csv(df6, "nifH_dada2_phylum.csv")



##---------------------------------------------------------------------------------------
##-----------------How to locate missing child nodes in parent nodes---------------------
## This is just an example of how to locate a missing child node. In the XML file provided, 
## this has already been checked for all the nodes used to generate the database. 
## In the script below, the output of "missingdf %>% rowid_to_column() %>% filter_all(any_vars(is.na(.)))" 
## will show <0 rows> if there are no missing nodes. If a node is missing, it's location can be determined 
## from the output, which is in the same order as the XML file. 

## For example, if the output shows an NA in row #13, take a neighboring row's accession number (e.g. row 12) 
## and keyword search this in the XML file. The missing node would be in the subsequent entry.  
##---------------------------------------------------------------------------------------
##---------------------------------------------------------------------------------------

missing <- xpathApply(nifH, "//species",
                      function(x){
                        if("acc" %in% names(x))
                          c(xmlValue(x[["acc"]]))
                        else NA})

missingdf <- ldply(missing,data.frame)  

missingdf %>% rowid_to_column() %>% filter_all(any_vars(is.na(.)))




