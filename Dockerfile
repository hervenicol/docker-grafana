FROM debian:wheezy
MAINTAINER Herve Nicol

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -yq

RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq \
	--no-install-recommends \
	supervisor wget adduser libfontconfig \
	libfreetype6 fontconfig-config ucf ttf-dejavu-core ttf-bitstream-vera ttf-freefont gsfonts-x11 gsfonts xfonts-utils fonts-freefont-ttf libfontenc1 libxfont1 x11-common xfonts-encodings

# Grafana install
RUN wget --no-check-certificate https://grafanarel.s3.amazonaws.com/builds/grafana_2.0.2_amd64.deb -O /tmp/grafana.deb && \
dpkg -i /tmp/grafana.deb && \
rm /tmp/grafana.deb

# supervisord configuration
RUN sed -i -e 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf
ADD configfiles/supervisor-grafana.conf /etc/supervisor/conf.d/grafana.conf

EXPOSE 3000
CMD /usr/bin/supervisord

