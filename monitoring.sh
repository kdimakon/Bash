#!/bin/bash


function cpu ()
{
      CORES=$(nproc)
      LOAD_AVERAGE=$(uptime | awk '{print $8}' | sed 's/,//g')
      LOAD_PERCENT=$(echo "scale=2; $LOAD_AVERAGE * 100" | bc)

      echo -e "-------------------- CPU USAGE FOR MINUTE --------------------"
      echo -e "NUMBER OF CORES:\t\t$CORES\n"
      echo -e "LOAD CPU:\t\t\t\t$LOAD_PERCENT%"
      echo -e "--------------------------------------------------------------"

}

function mem ()
{

      TOTAL_MEM=$(free -m | awk 'NR == 2{print $2}')
      USED_MEM=$(free -m | awk 'NR == 2{print $3}')
      USED_MEM_PERCENT=$(echo "scale=2; $USED_MEM * 100 / $TOTAL_MEM" | bc)

      TOTAL_SWAP=$(free -m | awk 'NR == 3{print $2}')
      USED_SWAP=$(free -m | awk 'NR == 3{print $3}')

      AVAILABLE_MEM=$(free -m | awk 'NR == 2{print $7}')

      echo -e "-------------------- MEM USAGE FOR MINUTE --------------------"
      echo -e "\nAVAILABLE MEMORY:\t\t$AVAILABLE_MEM\n"
      echo -e "TOTAL MEMORY:\t\t\t$TOTAL_MEM"
      echo -e "USED MEMORY:\t\t\t$USED_MEM\n"
      echo -e "TOTAL SWAP:\t\t\t\t$TOTAL_SWAP"
      echo -e "USED SWAP:\t\t\t\t$USED_SWAP\n"
      echo -e "USED MEMORY PERCENT:\t$USED_MEM_PERCENT%"
      echo -e "--------------------------------------------------------------"
}

function disk_usage () 
{
      ROOT_DISK_USAGE=$(df -h | grep -w '/' | awk '{print $5}')
      ROOT_DISK_AVAIL=$(df -h | grep -w '/' | awk '{print $4}')

      echo -e "-------------------- DISK USAGE FOR MINUTE -------------------"
      echo -e "ROOT DISK USAGE:\t\t$ROOT_DISK_USAGE\n"
      echo -e "ROOT DISK AVAILABLE:\t$ROOT_DISK_AVAIL"
      echo -e "--------------------------------------------------------------"

}

function main ()
{
  cpu
  mem
  disk_usage
}

main > ./monitoring.txt
