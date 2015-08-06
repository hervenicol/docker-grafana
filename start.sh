#!/bin/bash

###################
# Run this script to create and run your Grafana container.
###################

#### Configuration ####
IMAGE_NAME="hervenicol/grafana"
IMAGE_TAG="2.1.0"
CONT_NAME="grafana"
PORT_WEB="3000"
INFLUXDB_CONT_NAME="influxdb"
#### End Configuration ####

docker run -p "$PORT_WEB":3000 -d -i -t \
	--name "$CONT_NAME" \
	--link "$INFLUXDB_CONT_NAME:influxdb" \
	"$IMAGE_NAME":"$IMAGE_TAG"

