#!bin/bash

while read line
do
	echo "$line"
done < test01.txt

sleep 5

while read line
do
	echo "$line"
done < test02.txt

sleep 5

while read line
do
	echo "$line"
done < test03.txt
