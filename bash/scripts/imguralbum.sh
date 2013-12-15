#!/bin/bash
#############################################################
# Script to download all images in an imgur.com album
# to disk.
# USAGE: ./imgur.sh http://imgur.com/a/id
#############################################################

#- We do not need to set url to ''

## With unique tempfiles, multiple instances can run simuntaneously
tf=$(mktemp .imgur.XXXXX)

url=$1
#- A separate usage is nice, but is is used only once: embed it into the if
if [[ -z $url ]]; then
	echo -e "Imgur Album downloader\nUsage: $0 <album url>"
	exit 1
fi

if [[ "$url" =~ "imgur.com/a/" ]]; then
	## We have no special need for curl; wget is AFAIK more often preinstalled
	wget -q -O "$tf" "($(< /dev/stdin))"
	#title=$(awk -F \" '/data-cover/ {print $6; exit}' $ass)
	## I don't know enough about awk to speak of it, but regex is nice:
	title=$(grep -Po '(?<=data-title=").*?(?=" )' "$tf") # A lookabehind, nongreedy and ending lookahead
	albumid=$(grep -Po '(?<=id="album-).{5}(?=")' "$tf") # Ids are 5 chars
	if [[ -z $title ]]; then
		#title=$(awk -F \" '/data-cover/ {print $8}' $ass)
		## data-cover can also be something like LPzCFb.jpg, so...
		# Let's just use the album id
		title=$albumid
	fi
	title=${title// /_}
	dir="${title//[^a-zA-Z0-9_]/}"
	if [[ -d $dir ]]; then
		echo "Directory '$dir' already exists, you may have downloaded this album before."
		exit 1
	fi
	#else ## Else is unneeded
	## Worst case: Using the album id, the dirname should never be empty
	if [[ -z $dir ]]; then
		title=$albumid
	fi
	echo "Saving to '$dir'"
	mkdir -p $dir

	#for image in $(awk -F \" '/data-src/ {print $10}' $ass | sed /^$/d | sed s/s.jpg/.jpg/); do
	## Some images are so big they won't be displayed fully. With this we get full links!
	for image in $(grep -Po '(?<=a href=")http://i\.imgur.*?(?=")' "$tf"); do
		#filename=$(sed s/http:\\/\\/i.imgur.com\\/// <<< $image)
		#...
		#fi
		## We don't need to guess the filetype nor create the name, wget handles that (<<< is neat though)
		echo -n "Downloading '$image'..."
		wget -q -P "$dir" "$image" # -P will set directory prefix
		if [ "$?" = "0" ]; then echo " Done."; else echo "Failed.."; fi
	done
fi

#- No need to tell the user about tempfiles
rm "$tf"
echo "All done!"
