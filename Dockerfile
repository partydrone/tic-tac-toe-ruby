FROM ruby:latest
LABEL author="Andrew Porter <partydrone@icloud.com>"

WORKDIR /opt/ruby
COPY Gemfile* ./
RUN bundle config set system 'true'
RUN bundle install
COPY . .
