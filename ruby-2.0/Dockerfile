FROM ubuntu:12.04
MAINTAINER docker@1uptalent.com

# install ruby dependencies
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y libssl-dev
RUN apt-get install -y libreadline-dev
RUN apt-get install -y libffi-dev
RUN apt-get install -y libgdbm-dev

# install ruby from sources
ADD http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p353.tar.gz /
RUN cd ruby-2.0.0-p353.tar.gz/ruby-2.0.0-p353 && ./configure --disable-install-doc --with-openssl-dir=/usr/bin && make && make install
# cleanup
RUN rm -rf ruby-2.0.0-p353.tar.gz

# install Bundler
RUN gem install bundler --version 1.5.2

# Install IRB configuration
ADD irbrc /.irbrc
