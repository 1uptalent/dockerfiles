1uptalent/haproxy-1.5
=====================

Ubuntu based image with haproxy-1.5 compiled from source.

Check the `Dockerfile` for the exact versions.

## Running

HAProxy needs to be given the path to the configuration file with the `CONFIG` environment variable, which must be made available through a docker volume.

    docker run -t -i -v $PATH_TO_HAPROXY_CONFIG:/haproxy/haproxy.cfg -e CONFIG=$PATH_TO_HAPROXY_CONFIG -rm 1uptalent/haproxy-1.5

### With Syslog

To collect logs from HAProxy, if the host has a syslogd daemon, it is possible to map the socket in the container and use it in the configuration file.

    docker run -t -i -v $PATH_TO_HAPROXY_CONFIG:/haproxy/haproxy.cfg -v /dev/log:/haproxy/log -e CONFIG=$PATH_TO_HAPROXY_CONFIG -rm 1uptalent/haproxy-1.5

And make sure that your haproxy configuration includes something similar to:

    global
        log /haproxy/log local0

## Updating configuration

Just edit the configuration file.

    vi $PATH_TO_HAPROXY_CONFIG

The launcher included in the image monitors the config file and performs a graceful restart when the config file is touched.
This allows other processes to update haproxy as hosts come and go.

## Using an unprivileged user

The image includes an `haproxy` user and group. To run a more secure service, configure your haproxy to drop privileges after starting:

    global
        user haproxy
        group haproxy

