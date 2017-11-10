# certbot-rpi - [![Build Status](https://travis-ci.org/stevebargelt/certbot-rpi.svg?branch=master)](https://travis-ci.org/stevebargelt/certbot-rpi)

Raspberry Pi compatible Docker base image with [LetsEncrypt](https://letsencrypt.org/).

As you can see above this was forked from [bcecchinato/certbot-rpi](bcecchinato/certbot-rpi) - I really appreciate all of bcecchinato's work but I ran into an issue one night where I desperately needed to update my certificate on my home automation Raspberry Pi. I ran my normal docker command pulling bcecchinato's image and boom - a bug with the version of certbot that was pulled in as a submodule. Well after a bit of hair pulling I decided to fork and update the project myself. Then I decided to update the .travis.yml to grab/update the certbot submodule on every build.

* Pro: this image will always have the latest certbot bug fixes.
* Con: This image could introduce bugs from certbot master.

## What is LetsEncrypt?

![logo](https://letsencrypt.org/images/letsencrypt-logo-horizontal.svg)

Let’s Encrypt is a free, automated, and open certificate authority (CA), run for the public’s benefit. Let’s Encrypt is a service provided by the [Internet Security Research Group (ISRG)](https://letsencrypt.org/isrg/).

The key principles behind Let’s Encrypt are:

- **Free**: Anyone who owns a domain name can use Let’s Encrypt to obtain a trusted certificate at zero cost.
- **Automatic**: Software running on a web server can interact with Let’s Encrypt to painlessly obtain a certificate, securely configure it for use, and automatically take care of renewal.
- **Secure**: Let’s Encrypt will serve as a platform for advancing TLS security best practices, both on the CA side and by helping site operators properly secure their servers.
- **Transparent**: All certificates issued or revoked will be publicly recorded and available for anyone to inspect.
- **Open**: The automatic issuance and renewal protocol will be published as an open standard that others can adopt.
- **Cooperative**: Much like the underlying Internet protocols themselves, Let’s Encrypt is a joint effort to benefit the community, beyond the control of any one organization.


## Pull the Docker Image
Run all the commands from within the project root directory.

```bash
docker pull stevebargelt/certbot-rpi
```

## How to use this image

To get a new certificate:

```bash
docker run -it --rm -p 443:443 --name certbot \
  -v /etc/letsencrypt:/etc/letsencrypt          \
  stevebargelt/letsencrypt-rpi certonly --standalone -d your.domain.com
```

This is only a wrapper for the official client, built on a Raspberry Pi using [Hypriot](http://blog.hypriot.com/). The image is rebuilt every night.

The full details for the client commands are available on [Certbot GitHub project](https://github.com/certbot/certbot).

## License

LetsEncrypt-rpi is Open Source software released under the Apache 2.0 license.
