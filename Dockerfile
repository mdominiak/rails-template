FROM ruby:3.1.2

RUN gem install foreman --no-doc

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN bundle install

COPY . /usr/src/app/
CMD ["foreman", "start", "-f", "Procfile.dev"]
