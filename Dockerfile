FROM node:20.11.0 AS node

FROM ruby:3.2.2 AS base

COPY --from=node /usr/lib /usr/lib
COPY --from=node /usr/local/share /usr/local/share
COPY --from=node /usr/local/lib /usr/local/lib
COPY --from=node /usr/local/include /usr/local/include
COPY --from=node /usr/local/bin /usr/local/bin

RUN apt-get update

SHELL ["/bin/bash", "--login", "-c"]

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
RUN nvm install 20.11.0
RUN apt-get update && apt-get install -y nodejs

WORKDIR /psychology

# Copy all gemfile and dependencies
COPY Gemfile Gemfile.lock ./

# Install necessary gems and bundle
RUN gem install bundler
RUN gem install rake --version 13.2.1
# RUN bundle config set force_ruby_platform true
RUN bundle config set force_ruby_platform true
RUN nvm use 20.11.0
RUN bundle install
RUN bundle exec rails db:create

# Copy all files
COPY . .


EXPOSE 3000
