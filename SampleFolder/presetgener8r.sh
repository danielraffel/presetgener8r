#!/bin/bash

# create a text file with sample names for wav files from the folder contents
for dir in ./*; do (cd "$dir" && ls *.wav > replacement.filenames64.txt); done

# create another file with up to 8 of the samples in the folder
for dir in ./*; do (cd "$dir" && sed '9,$d' replacement.filenames64.txt > replacement.filenames8.txt); done

# copy presets to sample folders 
for d in */; do cp -a ../TemplatePresets/. "$d"; done

# create key value pairs
for dir in ./*; do (cd "$dir" && nl -w1 -s 'SAMPLE ' replacement.filenames8.txt > keyvalue8.txt); done
# for dir in ./*; do (cd "$dir" && nl -w1 -s 'SAMPLE ' replacement.filenames64.txt > keyvalue64.txt); done

# run a python script and do some find and replace
for dir in ./*; do (cd "$dir" && python ../renamer8.py); done
# for dir in ./*; do (cd "$dir" && python ../renamer64.py); done

# delete the extra mess of files made during this process
for dir in ./*; do (cd "$dir" && rm keyvalue8.txt keyvalue64.txt replacement.filenames8.txt replacement.filenames64.txt preset.first8.yml preset.first8.yml preset.upto64.yml); done

# Rename the preset after the folder
# for g in */; do (cd "$dir" && mv new.preset.first8.yml "$g.8.yml"); done
