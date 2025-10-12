FROM ruby:3.4-alpine

ADD Gemfile* /sidekiq/
WORKDIR /sidekiq
RUN bundle config set --local without test development \
  && bundle install

ADD config.ru /sidekiq/

EXPOSE 3030
ENTRYPOINT []
CMD rackup config.ru -o 0.0.0.0 -p 3030 -q
