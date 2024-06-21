#!/bin/bash

volumes=$(docker volume ls --format "{{.Name}}")

for volume in $volumes
do
    echo "Volume: $volume"
    docker volume inspect $volume --format "{{json .CreatedAt}}"
    echo ""
done
