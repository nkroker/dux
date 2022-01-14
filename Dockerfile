FROM bitnami/rails:6.1.3-0-debian-10-r6

RUN mkdir /app

WORKDIR /app

COPY ./ /app

RUN gem install bundler:2.1.2

EXPOSE 3000

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0", "-p", "3000"]
