FROM ubuntu:18.04

ENV RUBY_VERSION 2.6.3
ENV NODE_VERSION 12.6.0
ENV YARN_VERSION 1.17.3

RUN sed -i.bak -e "s%http://archive.ubuntu.com/ubuntu/%http://ftp.iij.ad.jp/pub/linux/ubuntu/archive/%g" /etc/apt/sources.list

RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  curl \
  git \
  ca-certificates \
  libreadline-dev \
  libidn11-dev \
  libssl-dev \
  zlib1g-dev \
  mecab \
  mecab-ipadic-utf8 \
  libc6-dev \
  build-essential \
  libmecab-dev \
  libfreetype6-dev \
  libxft-dev \
  wget \
  gnupg \
  sudo \
  ffmpeg \
  libmysqlclient-dev 
  
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata

RUN apt-get -y install mysql-server 

RUN export MECAB_PATH=/usr/lib/libmecab.so.2

# Yarn
RUN curl -L --compressed "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz" > /tmp/yarn.tar.gz \
  && tar -xzf /tmp/yarn.tar.gz -C /opt \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn-v$YARN_VERSION/bin/yarnpkg /usr/local/bin/yarnpkg \
  && rm /tmp/yarn.tar.gz

# Ruby
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv \
  && echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc \
  && echo 'eval "$(rbenv init -)"' >> ~/.bashrc
RUN export PATH="$HOME/.rbenv/bin:$PATH" \
  && eval "$(rbenv init -)" \
  && mkdir -p "$(rbenv root)"/plugins \
  && git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build \
  && rbenv install $RUBY_VERSION \
  && rbenv global $RUBY_VERSION \
  && rbenv rehash \
  && gem update --system \
  && yes y | gem update \
  && gem clean \
  && gem install bundler:1.17.3 \
  && rbenv rehash

# Node.js
RUN git clone https://github.com/nodenv/nodenv.git ~/.nodenv \
  && echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bashrc \
  && echo 'eval "$(nodenv init -)"' >> ~/.bashrc
RUN export PATH="$HOME/.nodenv/bin:$PATH" \
  && eval "$(nodenv init -)" \
  && mkdir -p "$(nodenv root)"/plugins \
  && git clone https://github.com/nodenv/node-build.git $(nodenv root)/plugins/node-build \
  && nodenv install $NODE_VERSION \
  && nodenv global $NODE_VERSION \
  && nodenv rehash

RUN apt-get -y install openssl

RUN rm -rf /var/lib/apt/lists/*

RUN mkdir /repo
WORKDIR /repo