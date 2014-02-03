FROM ubuntu:12.04
MAINTAINER docker@1uptalent.com

# install ruby dependencies
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y libssl-dev
RUN apt-get install -y libreadline-dev
RUN apt-get install -y libffi-dev
RUN apt-get install -y libgdbm-dev

# Install IRB configuration
ADD irbrc /.irbrc

# install ruby from sources
ADD http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.bz2 /build
RUN cd /build/ruby-2.1.0 && ./configure --disable-install-doc --with-openssl-dir=/usr/bin && make && make install
# cleanup
RUN rm -rf /build

# install Bundler
RUN gem install bundler --version 1.5.2
