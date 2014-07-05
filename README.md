# Table of Contents
- [Introduction](#introduction)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Upgrading](#upgrading)

# Introduction
Dockerfile to build a Rygel DLNA/uPNP server docker image.

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
docker run --name=rygel -it --rm \
-v /path/to/music:/music \
-v /path/to/videos:/videos \
-v /path/to/pictures:/pictures \
sameersbn/rygel:latest
```

This will start the rygel server and you should now be able to browse the content on DLNA/uPNP compatible devices.

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
docker run --name=rygel -d [OPTIONS] sameersbn/rygel:latest
```
