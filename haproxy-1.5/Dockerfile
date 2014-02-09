FROM ubuntu:12.04
MAINTAINER docker@1uptalent.com

# Add UNIVERSE (not in the trusted-build version of ubuntu 12.04)
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list

# install ruby dependencies
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y libssl-dev
RUN apt-get install -y libpcre3-dev

# install from sources
RUN mkdir /build
ADD http://haproxy.1wt.eu/download/1.5/src/devel/haproxy-1.5-dev21.tar.gz /build
RUN cd /build/haproxy-1.5-dev21 && make TARGET=linux2628 CPU=native USE_PCRE=1 USE_OPENSSL=1 USE_ZLIB=1 && make install
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
