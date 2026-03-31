#!/bin/bash

networks=$(docker network ls --format "{{.ID}}:{{.Name}}")

for network_info in $networks
do
    network_id=$(echo $network_info | cut -d: -f1)
    network_name=$(echo $network_info | cut -d: -f2)
    
    echo "Network ID: $network_id"
    echo "Network Name: $network_name"
    
    creation_time=$(docker network ls --filter id=$network_id --format "{{.CreatedAt}}" | awk '{print $1, $2}')
    echo "Creation Time: $creation_time"
    echo ""
done

