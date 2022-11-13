FROM ruby:3.1

WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install

CMD bin/rails server -b 0.0.0.0
