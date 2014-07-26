#!/bin/bash

path="TL"
inte=3
if [[ "$1" != "" ]]; then path="$1"; fi
if [[ "$2" != "" ]]; then inte="$2"; fi

if [[ ! -e "$path" ]]; then
	mkdir "$path"
elif [[ ! -d "$path" ]]; then
	echo "error: target exists, but not a directory"
	exit 1
fi

i=1
while [[ -e "$path/p$i.jpg" ]]; do let "i++"; done

starti=$((i))
stime=$(date)
sepoc=$(date +"%s")

clear
echo "shlapse // LD edition // by Aurel300 <thenet.sk>"
echo "directory: $path"
echo "interval:  $inte seconds / frame"
echo "starttime: $stime"
echo "status:    recording, press ctrl-c to pause"

function cleanup(){
	# uncomment line below to output recording status to a file
	#printf "0" > "shlapse_status.txt"
	etime=$(date)
	eepoc=$(date +"%s")
	diff=$(($eepoc - $sepoc))
	echo
	echo
	echo "recorded $(($i - $starti)) frames"
	echo "in $(($diff / 60)) minutes and $(($diff % 60)) seconds"
	echo "-STOP $etime / p$i.jpg ($(($i - $starti)) frames)" >> "tl_log.txt"
}

trap cleanup EXIT

# uncomment line below to output recording status to a file
#printf "1" > "shlapse_status.txt"
echo "START $stime / p$i.jpg" >> "tl_log.txt"

while [[ true ]]; do
	printf "\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\b\bframe:     $i"
	screencapture -t jpg -x "$path/p$i.jpg" "$path/q$i.jpg"
	# uncomment line below to ouput frame number to a file
	#printf "$i" > "shlapse.txt"
	let "i++"
	sleep $inte
done
