# configure_functional_analysis.R

# Adrián Segura Ortiz
# Fiorella Piriz Sapio
# Sandra Castro Labrador
# María del Rocio Valderrama Palacios

# Limpieza del workspace
rm(list = ls())
gc()

# Cierre de los dispositivos gráficos
graphics.off()

###################################################################
#### DEFINE LA FECHA
## variable para personalizar los ficheros

HOY <- format(Sys.time(), "%F_%H.%M.%S") #Sirve para crear un identificador Ãºnico de la ejecuciÃ³n
###################################################################


######################################################################
#### PATH TO THE functionalAnalysis SOURCE FILES
#

# Si dependiera del usuario:
#YO <- system ("whoami",intern = TRUE) # who-am-i es una funciÃ³n de bash para saber el usuario

# definir el directorio segÃºn el ordenador o usuario

# if (YO == "fulanito") {
# 	SOURCE_DIR = "~/Documents/MisScriptsR/"
# } else if (yo == "menganito") {
# 	SOURCE_DIR = "~/Documents/rstudio/"
# }

SOURCE_DIR = "~/Documents/MisScriptsR/functionalAnalysis/"

setwd(SOURCE_DIR)

######################################################################



######################################################################
#### PATH TO DATA-CONTAINING DIRECTORY 
#
DATA_DIR=""
if (YO == "rvalp") {
  DATA_DIR = "~/Documents/MisScriptsR/functionalAnalysis/data/"
} else {
  msg <- paste(sep = "", "\n** ERROR **:\n")
  msg <- paste(sep = "", msg, "** No se ha definido ",
               DATA_DIR, " para el usuario ", YO, " **\n")
  # salir del programa para arreglar el error
  stop(msg, call. = FALSE)
}
######################################################################


######################################################################
#### TYPE OF GRAPHICAL OUTPUT
#

SAVE_PDF <- TRUE
######################################################################


######################################################################
#### THRESHOLD FOLD-CHANGE
#

lfc <- 4
######################################################################


######################################################################
#### THRESHOLD P-VALUE

pval = 0.0001
######################################################################


# load the executable script
executable_file <- paste(sep = "", SOURCE_DIR, "libraries_functionalAnalysis.R")
source(executable_file)

# remove useless variables
rm(executable_file)


############################
## END CONFIGURATION FILE ##
############################