# ObsToDavinciResolve
A script for converting a recording in OBS to multiple files usable by Davinci Resolve (Linux)
  
# Motivation
Enjoying both video editing and using Linux, I prefer to use Davinci Resolve as my video editor. The only issue is that Davinci Resolve doesn't suppor the h.264 encoding format. For a while, I would manually re-encode videos, but that wasn't all that efficient. So in-response to the inefficiency of re-encoding manually, I wrote this script to streamline the process.

# Usage Note
This is designed to be use with OBS's MKV format with all 6 audio channels being recorded. It hasn't been tested with other formats.

# Usage
./convertForDavinciResolve.sh [originalVideoName.extension] (optional)[newVideoName.extension]

# Features
* Automated Renaming of videos/projects (optional)
* Creation of project folders
* Original video stored
* Converted video stored
* Sepearated Audio/Video Files
* Master Audio Track File
* Independent Audio Channel Tracks