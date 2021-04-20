#!/bin/bash
originalVideo=$1
renameVideo=$2
echo $renameVideo
#if video rename was given, renames the video and accompanying files/folders
###New Name needs to be newFileName.extension
###ie: oldFileName.mkv > newFileName.mkv
if [ -z $renameVideo ]
then
  #Do Nothing
  echo "No Renaming Needed."
else
  echo "renaming $originalVideo to $renameVideo"
  mv $originalVideo $renameVideo
  originalVideo=$renameVideo
fi

projectName=${originalVideo::-4}
convertedVideo="$projectName.mov"

#Creates project folder to store everything
#mkdir $projectName

#Extracts multi-track audio into seperate audio files
#ffmpeg -i $originalVideo -map 0:a:0 -f flac $originalVideo.flac

#Converts video to format useable by Davinci Resolve
#HandBrakeCLI -i $originalVideo -o $convertedVideo --encoder mpeg4 --vfr --two-pass --turbo

ffmpeg -i $originalVideo -map 0:0 -map 0:a:0 -map 0:a:1 -map 0:a:2 -map 0:a:3 -map 0:a:4 -vcodec mpeg4 -q:v 2 -acodec pcm_s16be -q:a 0 -f mov $convertedVideo
#Moves the original video file to the project folder
#mv $originalVideo $projectName/$originalVideo
