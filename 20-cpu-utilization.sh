#!/bin/bash


# cpu_usage=$(mpstat 1 1 | awk '/all/{print 100 - $NF}')

# echo "CPU Usage: ${cpu_usage}%"



cpu_usage=$(mpstat 1 1 | awk '/all/ {print 100 - $NF}')

echo "CPU Usage: ${cpu_usage}%"
