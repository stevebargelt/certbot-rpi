FROM resin/rpi-raspbian:jessie
MAINTAINER Steve Bargelt <steve@bargelt.com>

EXPOSE 443

VOLUME /etc/letsencrypt /var/lib/letsencrypt

WORKDIR /opt/certbot

ENV DEBIAN_FRONTEND=noninteractive

COPY letsencrypt-auto-source/letsencrypt-auto /opt/certbot/src/letsencrypt-auto-source/letsencrypt-auto
RUN /opt/certbot/src/letsencrypt-auto-source/letsencrypt-auto --os-packages-only && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/*

COPY setup.py README.rst CHANGES.rst MANIFEST.in letsencrypt-auto-source/pieces/pipstrap.py /opt/certbot/src/

COPY certbot /opt/certbot/src/certbot/
COPY acme /opt/certbot/src/acme/
COPY certbot-apache /opt/certbot/src/certbot-apache/
COPY certbot-nginx /opt/certbot/src/certbot-nginx/


RUN virtualenv --no-site-packages -p python2 /opt/certbot/venv

# PATH is set now so pipstrap upgrades the correct (v)env
ENV PATH /opt/certbot/venv/bin:$PATH
RUN /opt/certbot/venv/bin/python /opt/certbot/src/pipstrap.py && \
    /opt/certbot/venv/bin/pip install \
    -e /opt/certbot/src/acme \
    -e /opt/certbot/src \
    -e /opt/certbot/src/certbot-apache \
    -e /opt/certbot/src/certbot-nginx

ENTRYPOINT [ "certbot" ]
