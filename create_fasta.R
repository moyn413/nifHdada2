#Script to convert database (csv format) into fasta format
#To include cluster information, use "tax2" otherwise use "tax) 

setwd(".../v2.0.5")
df<-read.csv(".../v2.0.5/nifH_dada2_phylum_v2.0.5.csv", header = TRUE)


writeFasta<-function(data, filename){
  fastaLines = c()
  for (rowNum in 1:nrow(data)){
    fastaLines = c(fastaLines, as.character(paste(">", data[rowNum,"tax"], sep = ""))) #Modify here to tax/tax2 accordingly
    fastaLines = c(fastaLines,as.character(data[rowNum,"sequence"]))
  }
  fileConn<-file(filename)
  writeLines(fastaLines, fileConn)
  close(fileConn)
}


# write fasta file with clusters in taxonomy
writeFasta(df, "nifH_dada2_v2.0.5.fasta")


