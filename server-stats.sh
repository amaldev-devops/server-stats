#!/bin/bash

GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${BLUE}=======================================================================${NC}"
echo -e "${CYAN}                       SERVER PERFORMANCE STATS                        ${NC}"
echo -e "${BLUE}=======================================================================${NC}"




# 1. Strech Goal : Basic System Info
echo -e "\n${GREEN}[+]System Information${NC}"
echo "OS Version: 	$(lsb_release -d 2>/dev/null | cut -f2 || cat /etc/os-releas | grep PRETTY_NAME | cut -d '"' -f2)"
echo "Uptime: 		$(uptime -p)"
echo "Load Average: 	$(uptime | awk -F'load average:' '{ print $2 }')"
echo "Logged Users 	$(who | wc -l)"

#2 Total CPU Usage
echo -e "\n${GREEN}[+] Total CPU Usage${NC}"
cpu_idle==$(vmstat 1 2 |tail -1 | awk '{print $15}')
cpu_usage=$((100 - cpu_idle))
echo "CPU Usage: ${cpu_usage}%"

