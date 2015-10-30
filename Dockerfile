FROM ruby:2.2.1
MAINTAINER Nate Armstrong <natearmstrong2@gmail.com>

RUN apt-get update && \
    apt-get install -y net-tools

# Install gems
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY Gemfile* /usr/src/app/
RUN bundle install
COPY . /usr/src/app

# Start server
EXPOSE 3000
