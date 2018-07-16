#!/bin/bash

#description    :Automatically installs fonts from Sync Client folder
#author		    :drom98
#date           :20180716
#version        :0.2   
#usage		    :bash SyncFonts.sh

echo "Please copy and paste the path of your sync fonts folder:"
echo "Ex: /home/user/MEGAsync/Fonts/"
read SyncFolder

if [ ! -d $SyncFolder ];
then
    echo "Directory not found."
    exit
fi

LocalFontsFolder="$HOME/.fonts/"

copy_files() {
    for i in $SyncFolder
    do
        cp -R -T -u "$SyncFolder" "$LocalFontsFolder"
    done

    #Check if the files were copied successfully
    if [ $? -eq 0 ];
    then
        echo "Fonts successfully installed in your system."
    else
        echo "Failing installing fonts."
    fi
}

#Check if the local fonts folder exists
if [ -d $LocalFontsFolder ]; 
then 
    copy_files
else
    #Creates .font folder 
    mkdir -v "$LocalFontsFolder"
    copy_files
fi