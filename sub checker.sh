#!/bin/bash
#LE0MX

if [ "$1" == "" ]
then
echo "How to use : ./sub checker.sh <sub list>"
echo "Ex : ./sub checker.sh sub_list.txt"

else

for sub in $(cat $1)
do
if [[ $(ping -c 1 $sub 2> /dev/null ) ]]
then
echo "$sub ++++++ pingo"
echo $sub >> valid_sub.txt
else
echo "$sub ------ Error"
fi
done

for ip in $(cat valid_sub.txt)
do
host $ip | cut -d " " -f 4|grep "." |uniq  >> ips.txt 
done

mv ips.txt sub.txt valid_sub.txt index.html  result_$3

echo "Done"
fi
