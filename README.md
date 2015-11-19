[![Docker Repository on Quay.io](https://quay.io/repository/sameersbn/rygel/status "Docker Repository on Quay.io")](https://quay.io/repository/sameersbn/rygel)

# Table of Contents
- [Introduction](#introduction)
- [Contributing](#contributing)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Cache Store](#cache-store)
- [Shell Access](#shell-access)
- [Upgrading](#upgrading)

# Introduction

Dockerfile to build a Rygel DLNA/uPNP server docker image.

# Contributing

If you find this image useful here's how you can help:

- Send a Pull Request with your awesome new features and bug fixes
- Help new users with [Issues](https://github.com/sameersbn/docker-rygel/issues) they may encounter
- Support the development of this image with a [donation](http://www.damagehead.com/donate/)

# Installation

Automated builds of the image are available on [Dockerhub](https://hub.docker.com/r/sameersbn/rygel) and is the recommended method of installation.

> **Note**: Builds are also available on [Quay.io](https://quay.io/repository/sameersbn/rygel)

```
docker pull sameersbn/rygel:latest
```

Alternately you can build the image yourself.

```
docker build -t sameersbn/rygel github.com/sameersbn/docker-rygel
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

# Shell Access

For debugging and maintenance purposes you may want access the containers shell. If you are using docker version `1.3.0` or higher you can access a running containers shell using `docker exec` command.

```bash
docker exec -it rygel bash
```

If you are using an older version of docker, you can use the [nsenter](http://man7.org/linux/man-pages/man1/nsenter.1.html) linux tool (part of the util-linux package) to access the container shell.

Some linux distros (e.g. ubuntu) use older versions of the util-linux which do not include the `nsenter` tool. To get around this @jpetazzo has created a nice docker image that allows you to install the `nsenter` utility and a helper script named `docker-enter` on these distros.

To install `nsenter` execute the following command on your host,

```bash
docker run --rm -v /usr/local/bin:/target jpetazzo/nsenter
```

Now you can access the container shell using the command

```bash
sudo docker-enter rygel
```

For more information refer https://github.com/jpetazzo/nsenter

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
