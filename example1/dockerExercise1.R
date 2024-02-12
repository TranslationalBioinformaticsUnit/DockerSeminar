# Read Meta data
library(GEOquery)
require(limma)
require(edgeR)

# Read data
urld <- "https://www.ncbi.nlm.nih.gov/geo/download/?format=file&type=rnaseq_counts"
path <- paste(urld, "acc=GSE198256", "file=GSE198256_raw_counts_GRCh38.p13_NCBI.tsv.gz", sep="&");
GSE198256_count <- as.matrix(data.table::fread(path, header=T, colClasses="integer"), rownames=1)

gds <- getGEO("GSE198256")
Meta_GSE198256 <- pData(gds$GSE198256_series_matrix.txt.gz@phenoData)
Group <- Meta_GSE198256[,c("disease state:ch1")]
dge <- DGEList(counts=GSE198256_count)

# Make sure on the metadata
Group[Group=="Covid19: Acute infection"] <- "Covid19AI"
Group[Group=="Covid19: Recovery 3Mo"] <- "Covid193Mo"
Group[Group=="Covid19: Recovery 6Mo"] <- "Covid196Mo"
design <- model.matrix(~ Group )
# Filter
keep <- filterByExpr(dge, design=design)
dge <- dge[keep,,keep.lib.sizes=FALSE]
# Normalization
dge <- calcNormFactors(dge)


# When the library sizes are quite variable between samples, then the voom approach is theoretically more powerful than limma-trend.
v <- voom(dge, design, plot=FALSE)
colnames(design) <- c("Intercept","Covid196Mo","Covid19AI","Healthy")
fit <- lmFit(v, design)

contrast.matrix <- makeContrasts(Covid19AI-Healthy, Healthy, 
                                 Covid196Mo-Healthy,    
                                 levels=design)
fit2 <- contrasts.fit(fit, contrast.matrix)
fit2 <- eBayes(fit2)
topTable(fit2) 

#export file
write.csv(fit2, file = "/output/fit2.csv", row.names = FALSE)

