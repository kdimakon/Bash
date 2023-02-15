#!/bin/bash

source /root/source_for_backup.txt

function backup_server ()
{
    
    while read -r ip
    do
        ping -c 1 "$ip" 2>/dev/null 1>/dev/null
        if [ "$?" = 0 ]
        then
            S_USERNAME="root"
            BACKUP_FILE="$S_NAME::$CURR_DATE.tar.gz"
            S_NAME=$(ssh -n $S_USERNAME@"$ip" 'hostname')
            
            ssh -n $S_USERNAME@"$ip" "tar czf - --one-file-system $W_BACKUP | ssh $FS_USERNAME@$FS_IP "cat > "$DIR"/"$BACKUP_FILE"""

            
            echo "$CURR_DATE: Server $S_NAME ($ip):  Backup was done " >> /root/log_backup.txt
        else
            mail -s "Server $ip isn't available" xxx@mailto.plus
            echo "$CURR_DATE: Server $ip: Server isn't available " >> /root/log_backup.txt
        fi
    done </root/ip.txt
    
}

backup_server 2>/dev/null &
