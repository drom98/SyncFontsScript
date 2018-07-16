#!/bin/bash

#description    :Automatically installs fonts from Sync Client folder
#author		    :drom98
#date           :20180716
#version        :0.1   
#usage		    :bash SyncFonts.sh

LocalFontsFolder="$HOME/.fonts/"
MegaSyncFolder="$HOME/MEGAsync/Fonts/"

#Check if the local fonts folder exists
if [ -d $LocalFontsFolder ]; 
then 
    for i in $MegaSyncFolder
    do
        cp -R -T -u "$MegaSyncFolder" "$LocalFontsFolder"
    done
else
    mkdir -v "$LocalFontsFolder"
    for i in $MegaSyncFolder
    do
        cp -R -T -u "$MegaSyncFolder" "$LocalFontsFolder"
    done
fi