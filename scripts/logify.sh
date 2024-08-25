#!/bin/bash

filepath=$1

create_log_entry() {
    local info_messages=("Connected to database" "Task completed successfully" "Operation finished" "Initialized application")
    local random_message=${info_messages[$RANDOM % ${#info_messages[@]}]}
    local level=("INFO" "ERROR" "WARNING")
    local random_level=${level[$RANDOM % ${#level[@]}]}
    local http_status_code=200
    local ip_address="127.0.0.1"
    local emailAddress="user@mail.com"
    local pid=$$
    local ssn="407-01-2433"
    local time=$(date +%s)
    local log='{"status": '$http_status_code', "ip": "'$ip_address'", "level": "'$random_level'", "emailAddress": "'$emailAddress'", "msg": "'$random_message'", "pid": '$pid', "ssn": "'$ssn'", "time": '$time'}'
    echo "$log"
}

while true; do
    log_record=$(create_log_entry)
    echo "${log_record}" >> "${filepath}/$(date +%Y-%m-%d).log"
    echo "[$(date +"%Y-%m-%d+%H:%M:%S")] done"
    sleep 3
done
