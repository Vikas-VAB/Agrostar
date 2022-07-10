#!/bin/bash
USERNAME=vikas_bodke
PASSWORD=nHV6HxFbB6ZTPcRYZpqe
filename=allrepos.txt

read -p "you want to give repositories using repositories.txt file (type file) or through command line input (type stdin ):" option

if [ "$option" = "stdin" ]
then
	read -p "Enter repositories names separated by space: " repos_names

	for repo in $repos_names
	do

	curl -u "$USERNAME:$PASSWORD" -H "Content-type: application/json" "https://api.bitbucket.org/2.0/$repo/ssh-keys"
	done
 
elif [ "$option" = "file" ]
then
	while read line; do
        curl -u "$USERNAME:$PASSWORD" -H "Content-type: application/json" "https://api.bitbucket.org/2.0/repositories/agrostar/$line/deploy-keys" 

        done < $filename
else 
	echo " type file or stdin "
fi

