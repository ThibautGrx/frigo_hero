FROM ruby:3.2.0-bullseye as base

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

WORKDIR /docker/app

RUN gem install bundler

COPY Gemfile* ./

RUN bundle install

ADD . /docker/app

EXPOSE 3000

CMD [ "RAILS_ENV=production","bundle","exec", "puma", "config.ru", "-C", "config/puma.rb" ]