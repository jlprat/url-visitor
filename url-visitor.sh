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

#rewrite the header with an extra field at the end
echo "$(head -1 $file);present in springer link"

#skip the header
tail -n +2 $file | while read line
do
    url=$(echo $line | cut -d ';' -f $col)
    code=$(curl -I -L -s -o /dev/null -w "%{http_code}" $url)
    if [ $code == 200 ]
    then
        present=true
    else
        present=false
    fi
    echo "$line;$present"
done
