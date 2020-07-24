library(XML)
library(xml2)
library(methods)
library(tibble)
library(stringr)
library(plyr)
library(dplyr)
library(seqinr)


nifH <- xmlParse(file = "/Users/molly/Dropbox/NitrogenFixation_Singapore/Molecular/nifHdatabases/nifH2017_mod_v1.xml")

name <- xpathSApply(nifH,"//full_taxon_name",xmlValue)  # taxon name
tax <- xpathSApply(nifH,"//tax",xmlValue)               # taxonomy
acc <- xpathSApply(nifH,"//acc",xmlValue)               # accession number
seq <- xpathSApply(nifH,"//data",xmlValue)              # sequence

# make sequences all caps
seq <- toupper(seq)   

# bind into tibble
df=cbind(name,tax,acc,seq)
df=as_tibble(df)

x=df
