#!/bin/bash

###################
# Run this script to create and run your Grafana container.
###################

#### Configuration ####
IMAGE_NAME="hervenicol/grafana"
IMAGE_TAG="2.0.2"
CONT_NAME="grafana"
EXPOSED_PORT="30001"
#### End Configuration ####

docker run -p "$EXPOSED_PORT":3000 -d -i -t \
	--name "$CONT_NAME" \
	"$IMAGE_NAME":"$IMAGE_TAG"

