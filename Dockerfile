# Based on a light and trusted image
FROM debian:wheezy

MAINTAINER Herve Nicol


# Make sure system image is up to date
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -yq

# Install required applications:
#	supervisor, used to start our application(s)
#	wget, to get the grafana archive
#	sqlite3, to manipulate grafana data (I agree it would be better to use its API)
#	python and python-influxdb, to retrieve and manipulate influxdb data
#	+ various dependencies...
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq \
	--no-install-recommends \
	supervisor wget sqlite3 \
	python3 python3-pip \
	adduser libfontconfig libfreetype6 fontconfig-config ucf ttf-dejavu-core ttf-bitstream-vera ttf-freefont \
	gsfonts-x11 gsfonts xfonts-utils fonts-freefont-ttf libfontenc1 libxfont1 x11-common xfonts-encodings

# Grafana install
ADD https://grafanarel.s3.amazonaws.com/builds/grafana_2.5.0_amd64.deb /tmp/grafana.deb
RUN dpkg -i /tmp/grafana.deb && \
rm /tmp/grafana.deb

# supervisord configuration
RUN sed -i -e 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf
ADD configfiles/supervisor-grafana.conf /etc/supervisor/conf.d/grafana.conf

## initial setup script
USER grafana
# add script
ADD configfiles/generate_basic_grafana_config.sh /usr/local/bin/
# tell script to run
RUN touch /var/lib/grafana/please_do_initial_setup
USER root

RUN pip-3.2 install influxdb

# expose the Grafana daemon port
EXPOSE 3000

# Default run command, supervisord, which starts our app(s)
CMD /usr/bin/supervisord

