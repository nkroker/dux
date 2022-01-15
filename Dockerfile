FROM ruby:2.7.0

# We specify everything will happen within the /app folder inside the container
WORKDIR /app
# We copy these files from our current application to the /app container
COPY Gemfile Gemfile.lock ./

# We install all the dependencies
RUN bundle install

COPY ./ /app

RUN gem install bundler:2.1.2

RUN bundle exec rake db:migrate

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]
