#!/bin/bash

echo "Start"
fileName='strings-android.xml'
concatenateValue=""
concatenateKey=""
concatenating="FALSE"
type="string"

outputFile="string-ios.txt"

while read line; do 
    

    # IGNORE UNNECESSARY LINES
    if [[ $line == *"<?xml"* || $line == *"<resources"* || $line == *"<!--"*  || $line == *"</resources>"* ]]; then
      if [[ $line == *"<!--"* ]]; then
        printf "\n\n\n// $line\n" >> $outputFile
      fi
      continue
    fi

    # FILTER BY TYPE
    key=$(echo $line | sed 's/.*name=\"//; s/\">.*//')

    if [[ $line == *"<string name="* ]]; then
      value=$(echo $line | sed 's/.*\">//; s/<\/string.*//')

      if [ -z "$value" ]; then
        concatenating="TRUE"
        concatenateKey=$key
      fi
      type="string"

    elif [[ $line == *"<plurals name="* ]]; then
      concatenating="TRUE"
      type="plurals"
      concatenateKey=$key


    elif [[ $line == *"<string-array name="* ]]; then
      concatenating="TRUE"
      type="string-array"
      concatenateKey=$key
    fi


   # CONCATENATE VALUE
    if [[ $concatenating == "TRUE" &&  $type == "string" ]]; then
      if [[ $line != *"string"*  ]]; then
        concatenateValue="$concatenateValue $line"
      fi

    elif [[ $concatenating == "TRUE" &&  $type == "plurals" ]]; then
      if [[ $line != *"plurals"*  ]]; then
        concatenateValue="$concatenateValue $line"
      fi

    elif [[ $concatenating == "TRUE" &&  $type == "string-array" ]]; then
      if [[ $line != *"string-array"*  ]]; then
        concatenateValue="$concatenateValue $line"
      fi
    fi


    # WRITE VALUE
    if [[ $concatenating == "FALSE" ]]; then
      value=$(echo $line | sed 's/.*\">//; s/<\/string.*//')
      if [ -n "$value" ]; then 
        echo "\"$key\"=\"$value\"" >> $outputFile
      fi

    elif [[ $line == *"</string>"* || $line == *"</plurals>"* || $line == *"</string-array>"* ]]; then
      if [ -n "$concatenateValue" ]; then 
        echo "\"$concatenateKey\"=\"$concatenateValue\"" >> $outputFile
      fi
      
      concatenateValue=""
      concatenateKey=""
      concatenating="FALSE"
      type="string"
    fi
    
done < "$fileName"
echo "End"
