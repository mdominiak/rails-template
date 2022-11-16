FROM ruby:3.1

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true
ENV BUNDLE_FROZEN true

WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install --without development test

COPY . ./
RUN --mount=type=secret,id=production_key,dst=config/credentials/production.key \
    rails assets:precompile

CMD bin/rails server -b 0.0.0.0
