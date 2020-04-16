#!/bin/bash
SEARCH_FOLDER="../v1/*"
for f in $SEARCH_FOLDER
do
    if [ -d "$f" ]
    then
        for ff in $f/*
        do
		if [[ $ff == *.proto ]]
		then
			COMPILE=""
			for i in $(echo $ff | tr "/" "\n")
			do
			  if [[ $i == *.proto ]]
			  then
				echo "Compiling $ff"
				protoc -I $COMPILE $ff --go_out=plugins=grpc:.
				echo "Success"
			  else
				COMPILE+="${i}/"
			  fi
			done
		fi
        done
    else
		if [[ $f == *.proto ]]
		then
			echo "Processing file $f"
		fi
    fi
done
