#!/bin/sh
clear
export TZ=Asia/Hong_Kong
mkdir -p /app/logs
docker rm -f sleepy_natu
mem=$(free -g | head -2 | tail -1 | awk -F " " '{print $2}') # if you run to error, set mem to your system memory (in GB unit)
target_mem=$(echo "$mem * 0.9" | bc) # if you run to error, install bc
if [ -z "$target_mem" ]; then
    target_mem=4
fi
docker run --gpus all \
           -p 9999:9999 \
           -p 9090:9090 \
           -v /app:/app \
           -dt \
           --name=sleepy_natu \
           --memory="$target_mem"g \
           nde:latest \
           /bin/bash startup.sh
