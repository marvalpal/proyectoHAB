# libraries_functional_analysis.R

# Adrián Segura Ortiz
# Fiorella Piriz Sapio
# Sandra Castro Labrador
# María del Rocio Valderrama Palacios

ya_instalado <- rownames(installed.packages())
PKG_UPDATE = FALSE

#######################
## Librerías de CRAN ##
#######################

writeLines("\nComprobando las librerías de CRAN que hay que actualizar\n")

# define los paquetes que necesitas
requeridoCRAN <- c("dplyr")

# obtén los que aún no tienes instalados al comprobar los que NO ESTÁN en 'ya_instalado'
nuevos_CRAN <- requeridoCRAN[! requeridoCRAN %in% ya_instalado]

# instala los nuevos, siempre que el vector 'nuevos_CRAN' contenga algo
if (length(nuevos_CRAN)) {
  # instala los paquetes que no están
  install.packages(nuevos_CRAN, dependencies = TRUE, repos='http://cran.us.r-project.org')
  writeLines("CRAN libraries ")
  writeLines(nuevos_CRAN, sep = ", ")
  writeLines(paste("were installed at\n ", R.home()))
} else if (PKG_UPDATE) {
  update.packages(ask = FALSE)
} else {
  writeLines("Everything is updated")
}

# carga todos los paquetes
sapply(requeridoCRAN, require, character.only = TRUE)

# borrar variables que no se volverán a usar
rm(requeridoCRAN)
rm(nuevos_CRAN)

#################################################
## Instalación o actualización de Bioconductor ##
##    https://www.bioconductor.org/install/    ##
#################################################

# Comrpueba si hay que instalar BiocManager antes de instalar BioConductor
if (!requireNamespace("BiocManager", quietly = TRUE)){
  install.packages("BiocManager", repos="https://mirror.las.iastate.edu/CRAN/")
}

# instalación o actualización de Bioconductor
if (PKG_UPDATE) {
  BiocManager::install(ask = FALSE) # instala lo básico
}

# Versión instalada:
VERSION_BIOC <- BiocManager::version()

# paquetes necesarios
requerido_BioC <- c("clusterProfiler",
                    "org.Hs.eg.db",
                    "DOSE",
                    "pathview",
                    "ReactomePA",
                    "RDAVIDWebService",
                    "biomaRt",
                    "RTCGAToolbox", 
                    "readxl",
                    "limma",
                    "edgeR",
                    "calibrate")

# conmprueba lo que falta por instalar:
nuevos_BioC <- requerido_BioC[! requerido_BioC %in% ya_instalado]

# instala los nuevos, siempre que el vector 'nuevos_BioC' contenga algo
if(length(nuevos_BioC)) {
  # instala los paquetes que no están
  BiocManager::install(nuevos_BioC, ask = FALSE)
  writeLines(paste(sep = "", " Se instalaron las librerías de BioConductor ", VERSION_BIOC))
  writeLines(nuevos_BioC, sep = ", ")
} else {
  writeLines(paste(sep="", " BioConductor ", VERSION_BIOC, " ya estaba actualizado"))
}

# carga las liberías requeridas
sapply(requerido_BioC, require, character.only = TRUE)

# eliminar variables innecesarias
rm(ya_instalado)
rm(requerido_BioC)
rm(nuevos_BioC)

# avisar del éxito de la operación
writeLines("\n*** Librarías actualizadas y cargadas ***\n")