#!/bin/bash

# List of client IP addresses
SERVERS=("10.0.12.3" "10.0.13.3" "10.0.14.3" "10.0.15.3")

# List of client IP addresses being sshed into to connect to the servers
CLIENTS=("10.0.15.3" "10.0.14.3" "10.0.13.3" "10.0.12.3")

# Ports for the servers
PORTS=("5001" "5002" "5003" "5004")

# Target bandwidth
BANDWIDTH="1G"

# Packet size
PACKET_SIZE="512"

# Test duration
DURATION="3"

# Log file where the results will be saved
LOG_FILE="clients_results.log"

# Clear the log file if it exists (optional, uncomment to clear previous logs)
> $LOG_FILE

# Loop through each client and start iperf client in the background
for i in "${!SERVERS[@]}"; do
    SERVER=${SERVERS[$i]}
    CLIENT=${CLIENTS[$i]}
    PORT=${PORTS[$i]}
    echo "Starting iperf client on $CLIENT with port $PORT..."
    echo "Client IP: $CLIENT connecting to Server IP: $SERVER on Port $PORT ..." >> $LOG_FILE
    ssh node3@$CLIENT "iperf -c $SERVER -u -p $PORT -b $BANDWIDTH -t $DURATION -l $PACKET_SIZE"  >> $LOG_FILE &
done

# Wait for all background jobs to finish
wait
echo "All iperf clients finished."
