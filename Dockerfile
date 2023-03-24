FROM ruby:3.1.1

RUN apt-get update 

RUN mkdir -p /myapp
COPY . /myapp
WORKDIR /myapp

RUN bundle install
RUN rails db:migrate

ENTRYPOINT ["bundle", "exec"]
CMD rails s -b 0.0.0.0