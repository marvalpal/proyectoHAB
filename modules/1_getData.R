# set seed to be reproduciblish
set.seed(12345)
options(stringsAsFactors = FALSE)

.libPaths(c(.libPaths(), paste(getwd(),"software/deps_r",sep="/")))

#### Get the breast cancer gene expression data from TCGA
## Busca el archivo brca_rnaseq.RData en una carpeta paralela a modules llamada ficheros_descargados

# brca_rnaseq_2 <- load("~/Documents/MyRprojects/HAB/Analisis_funcional/brca_rnaseq_2.RData")
# brca_rnaseq <- load("~/Documents/MyRprojects/HAB/functional_analysis/brca_rnaseq.RData")
# save(brca_rnaseq, file = "brca_rnaseq_2.RData")
# write.table(brca_rnaseq, file = "brca_rnaseq.txt")
# brcaData <- getFirehoseData(dataset="BRCA", runDate="20160128",gistic2Date="20160128",forceDownload=F, clinical=TRUE, RNASeq2GeneNorm=TRUE)
# brca_rnaseq <- getData(brcaData,type = "RNASeq2GeneNorm")

# Hemos guardado los datos en un txt para que no obtengamos problemas (PRUEBA)
brca_rnaseq <- read.table("ficheros_descargados/brca_rnaseq.txt")

#### Gene expression data cleaning up
## keep only the tumour data. Sample type 01-09 in the samples barcode means tumour
brca_rnaseq.tumour <- brca_rnaseq[, which(as.numeric(substr(colnames(brca_rnaseq), 14,15)) < 10)]

## Convert barcodes from the rnaseq dataset to sample barcodes, which identify the patients. This way the sample ID is the same in the brca rnaseq matrix and in the supplementary table 1
colnames(brca_rnaseq.tumour) <- substr(colnames(brca_rnaseq.tumour), 1, 12)

## Make sure we don't have duplicated samples
brca_rnaseq.tumour <- brca_rnaseq.tumour[, !duplicated(colnames(brca_rnaseq.tumour))]

### write out the brca tumour rnaseq data matrix
save(brca_rnaseq.tumour, file = "ficheros_entrada/brca_rnaseq.RData")

## Read Supplementary data and import Table 1
sample_data <- readxl::read_xls("ficheros_descargados/nature11412-s2/Supplementary Tables 1-4.xls", sheet = 1, skip = 1)
save(sample_data, file="ficheros_entrada/sample_data.RData")
