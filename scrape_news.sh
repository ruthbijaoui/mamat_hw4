#!/bin/bash
wget https://www.ynetnews.com/category/3082 &> /dev/null
link_num=$(grep -oE "https://www.ynetnews.com/article/\b\w{9}\b" 3082 |sort |uniq | tee link.txt | wc -l>results.csv) 


while  IFS= read -r line ; do
	wget -O url.txt "$line" &> /dev/null
	netanyahu_num=$(grep -o 'Netanyahu' url.txt | wc -l )
	gantz_num=$(grep -o 'Gantz' url.txt | wc -l )
	if ((!netanyahu_num)) &&((!netanyahu_num)); then
		echo $line", -">>results.csv

	else
		echo $line", Netanyahu, "$netanyahu_num", Gantz, "$gantz_num>>results.csv
	fi
done < link.txt

rm link.txt 3082 url.txt
