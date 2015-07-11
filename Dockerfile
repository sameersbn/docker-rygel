FROM sameersbn/ubuntu:14.04.20150712
MAINTAINER sameer@damagehead.com

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv B84401E3 \
 && echo "deb http://ppa.launchpad.net/yg-jensge/gupnp/ubuntu trusty main" >> /etc/apt/sources.list \
 && apt-get update \
 && apt-get install -y rygel tumbler gstreamer1.0-plugins-base \
      gstreamer1.0-plugins-good gstreamer1.0-plugins-bad \
      gstreamer1.0-plugins-ugly gstreamer1.0-libav \
 && rm -rf /var/lib/apt/lists/* # 20150712

ADD rygel.conf /root/.config/

EXPOSE 8000
EXPOSE 1900/udp

VOLUME ["/root/.cache/rygel"]
VOLUME ["/videos"]
VOLUME ["/music"]
VOLUME ["/pictures"]

CMD ["/usr/bin/rygel" ]
