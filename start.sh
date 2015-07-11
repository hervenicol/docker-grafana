#!/bin/bash

docker run -p 30001:3000 -d -i -t \
	--name grafana \
	hervenicol/grafana:2.0.2

