#!/bin/bash
originalVideo=$1
projectName=${originalVideo::-4}
convertedVideo="$projectName/$projectName.m4v"


#Creates project folder to store everything
mkdir $projectName

#Extracts multi-track audio into seperate audio files
ffmpeg -i $originalVideo -map 0:a:0 -f flac $projectName/masterAudio.flac -map 0:a:1 -f flac $projectName/micAudio.flac -map 0:a:2 -f flac $projectName/voipAudio.flac -map 0:a:3 -f flac $projectName/gameAudio.flac -map 0:a:4 -f flac $projectName/mediaAudio.flac -map 0:a:5 -f flac $projectName/notificationsAudio.flac

#Converts video to format useable by Davinci Resolve
HandBrakeCLI -i $originalVideo -o $convertedVideo --encoder mpeg4 --vfr --quality 1 --two-pass --turbo --vb 6000
