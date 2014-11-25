# Table of Contents
- [Introduction](#introduction)
- [Contributing](#contributing)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Cache Store](#cache-store)
- [Upgrading](#upgrading)

# Introduction

Dockerfile to build a Rygel DLNA/uPNP server docker image.

# Contributing

If you find this image useful here's how you can help:

- Send a Pull Request with your awesome new features and bug fixes
- Help new users with [Issues](https://github.com/sameersbn/docker-rygel/issues) they may encounter
- Send me a tip via [Bitcoin](https://www.coinbase.com/sameersbn) or using [Gratipay](https://gratipay.com/sameersbn/)

# Installation

Pull the latest version of the image from the docker index. This is the recommended method of installation as it is easier to update image in the future. These builds are performed by the **Docker Trusted Build** service.

```
docker pull sameersbn/rygel:latest
```

Alternately you can build the image yourself.

```
git clone https://github.com/sameersbn/docker-rygel.git
cd docker-rygel
docker build -t="$USER/rygel" .
```

# Quick Start

Run the image

```
docker run --name=rygel -it --rm --net=host \
-v /path/to/music:/music \
-v /path/to/videos:/videos \
-v /path/to/pictures:/pictures \
sameersbn/rygel:latest
```

This will start the rygel server and you should now be able to browse the content on DLNA/uPNP compatible devices.

*P.S. You should run the image with host networking so that the server can be discovered over mDNS*

# Cache Store
You should mount a volume at `/.cache` for the cache.

```
docker run --name=rygel --net=host -d \
-v /path/to/music:/music -v /path/to/videos:/videos \
-v /path/to/pictures:/pictures -v /opt/rygel:/.cache \
sameersbn/rygel:latest
```

# Upgrading
To upgrade to newer releases, simply follow this 3 step upgrade procedure.

- **Step 1**: Update the docker image.

```
docker pull sameersbn/rygel:latest
```

- **Step 1**: Stop the currently running image

```
docker stop rygel
```

- **Step 3**: Start the image

```
docker run --name=rygel --net=host -d [OPTIONS] sameersbn/rygel:latest
```
