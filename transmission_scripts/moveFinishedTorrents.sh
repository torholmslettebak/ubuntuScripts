#!/bin/sh
#
#Bash extract videofile from rar, and move them to wanted dir
{
	torrentName="$TR_TORRENT_NAME"
	torrentDir="${TR_TORRENT_DIR}/${TR_TORRENT_NAME}"
#torrentDir=/home/tor/Downloads/Top.Gear.S22E06.720p.HDTV.x264-ORGANiC

	toDir="/media/tor/Black/fromDownload"
	mkdir "$toDir/""$torrentName"
	toDir="$toDir/""$torrentName"

# find rar file in torrentdir
#file=find /home/tor/Downloads/Top.Gear.S22E06.720p.HDTV.x264-ORGANiC/ -name "*.rar";
#list=`find /home/tor/Downloads/Top.Gear.S22E06.720p.HDTV.x264-ORGANiC/ -type f -name "*.rar"`

	list=`find $torrentDir -type f -name "*.rar"`


	unrar x $list $toDir
	subtitleDir=$(find $torrentDir -name \*sub\* -type d -maxdepth 1 -print | head -n1)
	if [ -z "$subtitleDir" ]; then
		echo "empty"
	else
		echo "not empty, the folder contains sub folder"
		echo "$subtitleDir"
		echo "now copying it to toDir"
		cp -R "$subtitleDir"/ "$toDir"/
	fi
} &