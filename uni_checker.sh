#!./usr/local/bin/bash

# Uniswap $UNI checker. Provide a file with list of your accounts and run the script against it. You will get list of acoounts valid for claim in result.txt
filename="$1"
while read -r line
do
    name="$line"
	result=$(curl -# -s -k -X GET https://gentle-frost-9e74.uniswap.workers.dev/1/$name | jq -r '.amount')
    echo -e "account: $name: $result"
	echo -e " " >>result.txt
done < "$filename"
# done
