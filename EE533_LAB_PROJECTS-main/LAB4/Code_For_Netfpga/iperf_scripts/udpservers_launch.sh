#!/bin/bash

# List of server IP addresses
SERVERS=("10.0.12.3" "10.0.13.3" "10.0.14.3" "10.0.15.3")

# Ports for the servers
PORTS=("5001" "5002" "5003" "5004")

# Log file where the results will be saved
LOG_FILE="servers_results.log"

# Clear the log file if it exists (optional, uncomment to clear previous logs)
> $LOG_FILE

# Loop through each server and start the iperf server in the background
for i in "${!SERVERS[@]}"; do
    SERVER=${SERVERS[$i]}
    PORT=${PORTS[$i]}
    echo "Starting iperf server on $SERVER with port $PORT..."
    ssh node3@$SERVER "iperf -s -u -p $PORT" >> $LOG_FILE & #& so running server in the background
done

# Wait for all background jobs to finish
wait
echo "All iperf servers started."

