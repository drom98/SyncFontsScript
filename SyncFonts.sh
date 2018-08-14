#!/bin/bash

#description    :Automatically installs fonts from Sync Client folder
#author		    :drom98
#date           :20180716
#version        :0.3   
#usage		    :bash SyncFonts.sh

LocalFontsFolder="$HOME/.fonts/"

#Check if .config file already exists
if [ -d .config ];
then
    check_local_fonts
else
    ask_path
fi

#Check if the local fonts folder exists
check_local_fonts() {
    if [ -d $LocalFontsFolder ]; 
    then 
        copy_files
    else
        #Creates .font folder 
        mkdir -v "$LocalFontsFolder"
        copy_files
fi
}

#Set the path of the sync client
ask_path() {
    echo "Please copy and paste the path of your sync fonts folder:"
    echo "Ex: /home/user/MEGAsync/Fonts/"
    read SyncFolder
}

#Copy fonts to local folder
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

#Verify if the sync folder exists
sync_folder_exists() {
    if [ ! -d $SyncFolder ];
    then
        echo "Directory not found."
        exit
    else
        echo "Do you want to save this path for future use?"
        echo "Yes/No"
        read yn
        case $yn in 
            [Yy]* ) mkdir .config
                cd .config
                echo "$SyncFolder">path.txt
                cd ..;;
            [Nn]* ) echo "You will have to write the path every time you execute the script";;
            * ) echo "Please answer yes or no";;
        esac
    fi
}
