FROM debian:wheezy
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
ADD http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p481.tar.bz2 /
RUN tar xvjf ruby-2.0.0-p481.tar.bz2 && cd ruby-2.0.0-p481 && ./configure --disable-install-doc --with-openssl-dir=/usr/bin && make && make install && cd / && rm -rf /ruby-2.0.0-p481

# cleanup
RUN rm -rf /build

# install Bundler
RUN gem install bundler --version 1.5.2
