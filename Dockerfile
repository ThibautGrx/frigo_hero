FROM ruby:3.2.0-bullseye as base

ENV RAILS_ENV=production

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

WORKDIR /docker/app

RUN gem install bundler

COPY Gemfile* ./

RUN bundle install

RUN rails assets:precompile

ADD . /docker/app

EXPOSE 3000

CMD ["bundle","exec", "puma", "config.ru", "-C", "config/puma.rb" ]