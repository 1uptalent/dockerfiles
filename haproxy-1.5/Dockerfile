FROM debian:wheezy
MAINTAINER docker@1uptalent.com

# install ruby dependencies
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y libssl-dev
RUN apt-get install -y libpcre3-dev

# install from sources
ADD http://haproxy.1wt.eu/download/1.5/src/devel/haproxy-1.5-dev25.tar.gz /
RUN tar xf haproxy-1.5-dev25.tar.gz && cd haproxy-1.5-dev25 && make TARGET=linux2628 CPU=native USE_PCRE=1 USE_OPENSSL=1 USE_ZLIB=1 && make install && cd / && rm -rf haproxy-1.5-dev25
# cleanup
RUN rm -rf /build

# Extra tools for the launch script
RUN apt-get install -y inotify-tools

# User/group (allows haproxy to drop privileges)
RUN groupadd haproxy
RUN useradd -r -g haproxy haproxy
ADD launch-haproxy.sh /haproxy/launch-haproxy.sh
RUN chmod u+x /haproxy/launch-haproxy.sh 
RUN chown -R haproxy:haproxy /haproxy
WORKDIR /haproxy
ENTRYPOINT exec /haproxy/launch-haproxy.sh
