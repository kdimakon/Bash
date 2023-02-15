#!bin/bash

source="./"           #source directory for backup files
dest=".github/"               #destination directory for backuping files

for files in $(find $source -printf "%P\n") 
    do 
        if [ -e $dest/$file ] 
            then
                if [$source/$file -nt $dest/$file ] 
                    then
                        echo "Newer file detected, copying..." 
                        cp -r $source/$file $dest/$file 
                    else
                        echo "File $file exist and no detected, skipping"
                fi 
            echo "File $file is being copyed over to $dest"
            cp -r $source/$file $dest/$file
        fi
    done