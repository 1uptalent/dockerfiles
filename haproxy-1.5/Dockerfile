FROM ubuntu:12.04
MAINTAINER docker@1uptalent.com

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

VOLUME  ["/config"]

ADD README.md ./README.md
