# base on latest ruby base image
FROM ruby:latest

# update and install dependencies
RUN apt-get update -qq && apt-get install -y build-essential apt-utils

RUN apt-get install -y libpq-dev postgis

RUN apt-get install -y libxml2-dev libxslt1-dev nodejs

# setup app folders
ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# copy over Gemfile and install bundle
# WORKDIR /tmp
ADD Gemfile* $APP_HOME/
RUN bundle install --jobs=4

# copy over remaining app files
ADD . $APP_HOME

EXPOSE 3000
