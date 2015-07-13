# docker-grafana
##Docker container for Grafana

Currently under early development, may not result in a functionnal container.


## Why this image?

I wanted to give access to a clean and well documented Grafana container, suitable for docker beginners as well as grafana beginners.

It means this container has:
* a public git repository
* an up to date docker image
* explanations on its structure and how to use


## mountpoints

Usefull mountpoints are:
* _/etc/grafana/grafana.ini_ - Config file. Mount it if you want to customize your config.
* _/var/lib/grafana_ - The Grafana database (sqlite). Mount this one for database persistency and backups.
* _/var/log_ - All log files.
    * _/var/log/grafana_ - Grafana log files, if you don't bother other logs.
    * _/var/log/supervisor_ - init system log files, traces container's process start/stop/restart.


## Ports

Exposed port is _:3000_.
This the Grafana interface web access.


## Included files

* _build.sh_ - Builds a Docker image from the git tree.
* _start.sh_ - Creates and runs your Grafana container.
* _Dockerfile_ - The recipe used by docker to create the image.
* _configfiles/_ - Additionnal files required for the image creation.


## First steps

Here I should explain how to use this docker image and go straight to the point.


