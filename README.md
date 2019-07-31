# apt-cache

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/nobodyxu/apt-cache.svg)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/nobodyxu/apt-cache.svg)

A docker image for caching apt packages for debian, raspberry pi, ubuntu official source, ubuntu PPA and canonical's parttern source based on squid-deb-proxy.

# Usage

## Pull from docker hub

Simply run:

```
docker pull nobodyxu/apt-cache
```

## Build it yourself

Use `make` to build the image.

## How to run it

Simply run `make run` to run the image as a container and also create a volume and publish the port 8000 for you.

## Use the proxy

Then add the following to `/etc/apt/apt.conf.d/01proxy` (create it if not exist) in your other containers or other machines:

```
Acquire::HTTP::Proxy "http://${HOST_IP}:${APT_PROXY_PORT}";
Acquire::HTTPS::Proxy "false";'
```

and it is all set!

If you have any problem using this repository or have advices on how to improve, please open a github issue and I will answer you as soon 
as possible.

Pull request is welcomed.

# Reference:

 1. https://github.com/sameersbn/docker-apt-cacher-ng
 2. https://gist.github.com/dergachev/8441335
