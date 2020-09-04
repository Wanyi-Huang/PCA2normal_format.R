## convert results to normal data frame£®º«µ√ªª ‰»Î£©
##for gcta
#eigvec <- read.table("snp.gcta.eigenvec", header = F, stringsAsFactors = F)
##for ldak
eigvec <- read.table("snp.ldak.weight.vect", header = F, stringsAsFactors = F)
colnames(eigvec) <- c("FID", "Sample", paste0("PC", 1:20))
#write.table(eigvec[2:ncol(eigvec)], file = "gcta.eigenvector.xls", sep = "\t", row.names = F, col.names = T, quote = F)
write.table(eigvec[2:ncol(eigvec)], file = "ldak.eigenvector.xls", sep = "\t", row.names = F, col.names = T, quote = F)

##for gcta
#eigval <- read.table("snp.gcta.eigenval", header = F)
##for ldak
eigval <- read.table("snp.ldak.weight.values", header = F)
pcs <- paste0("PC", 1:nrow(eigval))
eigval[nrow(eigval),1] <- 0
percentage <- eigval$V1/sum(eigval$V1)*100
eigval_df <- as.data.frame(cbind(pcs, eigval[,1], percentage), stringsAsFactors = F)
names(eigval_df) <- c("PCs", "variance", "proportion")
eigval_df$variance <- as.numeric(eigval_df$variance)
eigval_df$proportion <- as.numeric(eigval_df$proportion)
#write.table(eigval_df, file = "gcta.eigenvalue.xls", sep = "\t", quote = F, row.names = F, col.names = T)
write.table(eigval_df, file = "ldak.eigenvalue.xls", sep = "\t", quote = F, row.names = F, col.names = T)

