Docker Sinatra
==============

Starter files for running a sinatra app in docker. Great for quick json apis.

## Setup

### Install Docker
```
$ brew install docker
```

### boot2docker-xhyve

My preferred way of running docker on OS X is with
[boot2docker-xhyve](https://github.com/ailispaw/boot2docker-xhyve/).

```
$ brew install xhyve
$ git clone https://github.com/ailispaw/boot2docker-xhyve
$ cd boot2docker-xhyve
$ make
```

### Install Docker Compose

Though this is a single container application, [Docker Compose](https://docs.docker.com/compose/)
makes it easy to start and stop docker containers with a shared volume, a specified
port, and environment variables.

```
curl -L https://github.com/docker/compose/releases/download/1.4.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
```

### Build the docker image
```
docker-compose builld
```

### Start the server
```
docker-compose up
```

### Stopping the server

```
docker-compose stop
```

### Reloading changes

The starter pack uses the `rerun` gem which will automatically reload when there are
changes to `server.rb`. Changes to any other files will require a
`docker-compose stop` and `docker-compose up` before the changes are applied.
