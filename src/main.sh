# get the username via command parameter

declare user=$1

# get the github API json for the user

declare json=$(curl -s "https://api.github.com/users/$user")

# get information

declare name=$(echo $json | grep -o '"name": *"[^"]*"' | awk -F'"' '{print $4}')
declare bio=$(echo $json | grep -o '"bio": *"[^"]*"' | awk -F'"' '{print $4}')
if [[ $bio -eq "" ]]
then
	bio="No Info"
fi
declare followers=$(echo $json | grep -o '"followers": *[^,]*' | awk -F': ' '{print $2}')
declare following=$(echo $json | grep -o '"following": *[^,]*' | awk -F': ' '{print $2}')
declare repos=$(echo $json | grep -o '"public_repos": *[^,]*' | awk -F': ' '{print $2}')
declare birth=$(echo $json | grep -o '"created_at": *"[^"]*"' | awk -F'"' '{print $4}')

# print the info

echo
echo -e "\Uf0004 $name"
echo -e "\uea74 \"$bio\""
echo -e "\Uf0849 $followers followers"
echo -e "\Uf1570 $following following"
echo -e "\uf487 $repos"
echo -e "\Uf00eb $birth"
echo 
