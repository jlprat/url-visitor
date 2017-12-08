#!/bin/bash
if [ ! -f $1 ]
then
   echo "Please provide a file name"
   exit -1
fi
if [ -z $2 ]
then
    echo "Please provide the column number for the URL to check"
    exit -1
fi

file=$1
col=$2
if [ -z $3 ]
then
    sep=';'
else
    sep=$3
fi

#rewrite the header with an extra field at the end
echo "$(head -1 $file);Found"

#skip the header
tail -n +2 $file | while read line
do
    url=$(echo $line | cut -d $sep -f $col | tr -d '"')
    code=$(curl -I -L -s -o /dev/null -w "%{http_code}" $url)
    if [ $code == 200 ]
    then
        found=true
    else
        found=false
    fi
    echo "$line;$found"
done
