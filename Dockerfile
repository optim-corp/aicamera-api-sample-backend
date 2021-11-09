FROM ruby:3.0.2
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

EXPOSE 3000 587


CMD ["rails", "server", "-b", "0.0.0.0"]