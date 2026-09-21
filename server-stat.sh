#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${BLUE}====================================================${NC}"
echo -e "${CYAN}             SERVER PERFORMANCE STATS              ${NC}"
echo -e "${BLUE}====================================================${NC}"

# 1. Stretch Goal: Basic System Info
echo -e "\n[+] System Information"
echo "OS Version:	$(uname -sr)"
echo "Uptime:		$(uptime -p)"
echo "Logged Users:	$(who | wc -l)"

# 2. Total CPU Usage
echo -e "\n[+] Total CPU Usage"
# Calculate Usage from idle percentage using vmstat
cpu_idle=$(vmstat 1 2 | tail -1 | awk '{print $15}')
cpu_usage=$((100 - cpu_idle))
echo "CPU Usage: ${cpu_usage}%"

# 3. Total Memory Usage
echo -e "\n[+] Total Memory Usage"
free -m | awk 'NR==2{printf "Total: %d MB | Used %d MB (%.1f%%) | Free: %d MB (%.1f%%) \n", $2 , $3, ($3/$2)*100, $4, ($4/$2)*100}'

#4. Total Disk Usage
echo -e "\n[+] Total Disk Usage (Root)"
df -h | awk 'NR==2{ printf "Total: %s | used: %s (%s) | free: %s", $2 , $3 , $5 , $4}'

#. Top 5 processes by cpu usage
echo -e " \n[+] Top 5 Processes by CPU"
ps -eo pid,user,%cpu,%mem,comm --sort=-%cpu | head -n 6

#6. Top 6 Processes by Memory Usage
echo -e  "\n[+] Top 6 Processes by Memory"
ps -eo pid,user,%cpu,%mem,comm --sort=-%mem | head -n 6




echo "========================================================================================="
