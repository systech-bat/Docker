#!/bin/bash

today=$(date +%Y-%m-%d)

docker network ls --format '{{.ID}} {{.Name}} {{.CreatedAt}}' | while read -r id name created; do
  if [[ $created == $today* ]]; then
    echo "Deleting network $name with ID $id created on $created"
    docker network rm "$id"
  fi
done
