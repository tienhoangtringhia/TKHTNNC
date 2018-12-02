#!/bin/bash
echo "Exercise_4"
cp folder_01/file_V0*.v folder_02
cd folder_02

for n in 1 2 3 4
do
 file_name_1="file_V0$n"
 file_name_2="_T0$n.v"
 file_name_full=$file_name_1$file_name_2

 let m=5-n

 mv $file_name_full XXX_V$m$m.v
done

