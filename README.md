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
docker-compose build
```

### Start the server
```
docker-compose up
```

Your server is now running on port 3000 of your docker ip which you can get from running
`make ip` from within the `boot2docker-xhyve` directory. It will probably look something
like `http://192.168.64.2:3000/users`.

## Notes

### Stopping the server

```
docker-compose stop
```

### Reloading changes

The `rerun` gem is
[supposed to help with changes automatically being reloaded](http://www.sinatrarb.com/faq.html#reloading)
but I don't think it is working the way it should. The main `server.rb` file is
using [Sinatra Reloader](http://www.sinatrarb.com/contrib/reloader.html) so any changes
to `server.rb` should get picked up. But changes to other files will require a
`docker-compose stop` and `docker-compose start` which is not ideal.

### Forward localhost to docker ip

Because the server is running on the vm, the docker ip is only visible to your machine
which means the simulator can talk to it but your external device can not. Luckily
it is not to hard to [port-forward on mac osx](http://superuser.com/questions/30917/how-to-make-a-port-forward-in-mac-os-x).

1. Turn on Remote Login in System Preferences -> Sharing
2. Run the command below replacing the first ip address with your own (192.168.0.102)
and the second ip address with your docker ip (192.168.64.21).

```
ssh -L 192.168.0.102:3000:192.168.64.2:3000 -N 127.0.0.1
```

The command starts a process that forwards the port. Once you kill the process the
port is no longer forwarded which is nice.
