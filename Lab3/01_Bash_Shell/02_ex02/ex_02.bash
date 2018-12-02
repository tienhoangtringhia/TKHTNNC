#!/bin/bash
echo "Exercise_2"
argument=$1
file_name="file_$argument"
tail=".v"
file_name_full=$file_name$tail

cp folder_01/$file_name_full folder_02/

