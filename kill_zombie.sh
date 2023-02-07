#!/bin/bash

CH_PID=$(ps -aux | awk {'if ($8 == "Z") print $2'})                     # check zombie process, if it has one print his PID

PAR_PID=$(ps -o ppid= $CH_PID)                                          # find parent pid of zombie process

kill -s SIGCHLD $PAR_PID                                                # manually tell the parent to kill the zombie processes

CHECK=$(ps -aux | awk {'if ($8 == "Z") print $2'} > ./process)          # check zombie process again

if [ -s ./process ]                                                     # remove the remaining processes
then
for zpid in $PAR_PID
do
kill -9 $zpid
done
else
echo "zombie has been removed"
fi