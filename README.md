# docker-grafana
##Docker container for Grafana

Currently under early development, may not result in a functionnal container.

Contains Grafana 2.1.0
and connects to influxdb 0.9


## Why this image?

I wanted to give access to a clean and well documented Grafana container, suitable for docker beginners as well as grafana beginners.

It means this container has:
* a public git repository
* an up to date docker image
* explanations on its structure and how to use


## mountpoints

Usefull mountpoints are:
* __/etc/grafana/grafana.ini__ - Config file. Mount it if you want to customize your config.
* __/var/lib/grafana__ - The Grafana database (sqlite). Mount this one for database persistency and backups.
* __/var/log__ - All log files.
    * __/var/log/grafana__ - Grafana log files, if you don't bother other logs.
    * __/var/log/supervisor__ - init system log files, traces container's process start/stop/restart.


## Ports

Exposed port is __:3000__.
This the Grafana interface web access.


## Included files

* __build.sh__ - Builds a Docker image from the git tree.
* __start.sh__ - Creates and runs your Grafana container.
* __Dockerfile__ - The recipe used by docker to create the image.
* __configfiles/__ - Additionnal files required for the image creation.


## First steps

Documentation on how to have a simple graphing setup can be found here:

https://github.com/hervenicol/Graphing-suite/wiki



This image is meant to work with the influxdb container found here:

https://registry.hub.docker.com/u/hervenicol/influxdb/

