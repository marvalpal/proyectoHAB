#!/bin/bash
#launch.sh

echo "Ejecutando flujo de trabajo"
DIR="software/deps_r"
if [ ! -d "$DIR" ];then
	echo "Instalando librerías"
	sudo bash setup.sh 
fi
#echo "Introduce la ruta donde se localiza el proyecto"
#read filename
echo "Ejecutando scripts"
read -p "Escoja un análisis para comenzar Basal o TNBC: " INPUT;
Rscript modules/1_getData.R;
Rscript modules/2_subettingData.R;
if [ "$INPUT" = 'basal' ]; then
	Rscript modules/3_DEA.R Basal;
else
	Rscript modules/3_DEA.R TNBC;	
fi
echo "Ejecucion finalizada"
