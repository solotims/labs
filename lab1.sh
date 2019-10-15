#!/bin/bash
folder=$1
rm $folder/result.xls
echo "filename; type; modification date; size in bytes; duration" > $folder/result.xls

rec()
{

(
for i in $1/*; do

if [[ -d $i ]]; then
rec $i
continue
fi

clean=$(basename "$i")
filename=${clean%.*}

type=$(file --mime-type -b "$i")

mod=$(stat --format=%.10y "$i")

size=$(stat --format=%s "$i")

dur=$(mediainfo "$i" --Output="General;%Duration/String%")

echo "$filename;$type;$mod;$size;$dur"

done
)>>$folder/result.xls

}

rec $folder
