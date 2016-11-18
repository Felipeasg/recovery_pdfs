#!/bin/bash

# Get all pids of okular
pidofprogram=(`ps -C okular | grep -Po '^ [\d]+|^[\d]+'`)

foldername=`date +'%d-%m-%y'`

mkdir $foldername
cd $foldername

# for each pid of okular get what pdf is opened
for pid in "${pidofprogram[@]}"
do
	echo $pid
	pdffiles=`lsof -p $pid | grep pdf`

	for pdf in "${pdffiles[@]}" 
	do
		#echo $pdf
		pdffile=`echo $pdf | grep -Po  '(?<=\/).*(?=pdf)'`
		echo "/"$pdffile"pdf" >> pdfsopened

	done
done
