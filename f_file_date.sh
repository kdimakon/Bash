#!/bin/bash


echo -e "--------------------------FIND FILES-----------------------"
echo -e "Hello, this script for searching file by modification date.\n"
echo -e "Enter the date from which you want to search, finish date and repository\n"
echo -e "Please enter date correctly!\n Example: 01 Feb 2023\n"

read -p 'Repository: ' repo
read -p 'Start date: ' first_date
read -p 'Finish date: ' finish_date


str="$repo $first_date $finish_date"

for file in $(find $repo -type f -newerct "$first_date" ! -newerct "$finish_date")
do 
size=$(du -h $file | awk '{print $1}')
echo -e "$file -----\t $size"
done

echo -e "--------------------------FIND FILES-----------------------"