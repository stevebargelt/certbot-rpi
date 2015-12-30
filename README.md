# letsencrypt-rpi - ![master](https://secure.travis-ci.org/bcecchinato/letsencrypt-rpi.png?branch=master)

Raspberry Pi compatible Docker base image with [LetsEncrypt](https://letsencrypt.org/).  

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
docker pull bcecchinato/letsencrypt-rpi
```

### Run the Docker Image and get the version of the installed LetsEncrypt client
```bash
docker run -it --rm bcecchinato/letsencrypt-rpi --help
```

## How to use this image

This is only a wrapper for the official client, built on a Raspberry Pi using [Hypriot](http://blog.hypriot.com/). The image is rebuilt every night.

The full details for the client commands are available on [LetsEncrypt GitHub project](https://github.com/letsencrypt/letsencrypt).

## License

LetsEncrypt-rpi is Open Source software released under the Apache 2.0 license.
