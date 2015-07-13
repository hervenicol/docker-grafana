# docker-grafana
Docker container for Grafana

Currently under early development, may not result in a functionnal container.


# Why this image?

I wanted to give access to a clean and well documented Grafana container, suitable for docker beginners as well as grafana beginners.

It means this container has:
- a public git repository
- an up to date docker image
- explanations on its structure and how to use


# mountpoints

Usefull mountpoints are:
* /etc/grafana/grafana.ini
	Config file. Mount it if you want to customize your config.
* /var/lib/grafana
	The Grafana database (sqlite). Mount this one for database persistency and backups.
* /var/log
	All log files.
** /var/log/grafana
	Grafana log files, if you don't bother other logs.
** /var/log/supervisor
	init system log files, traces container's process start/stop/restart.


# Ports

Exposed port is :3000.
This the Grafana interface web access.


# Included files

* build.sh
	Builds a Docker image from the git tree.
* start.sh
	Creates and runs your Grafana container.
* Dockerfile
	The recipe used by docker to create the image.
* configfiles/
	Additionnal files required for the image creation.


# First steps

Here I should explain how to use this docker image and go straight to the point.


