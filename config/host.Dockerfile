FROM ruby:3.0.0

ENV RAILS_ENV production
RUN mkdir /peach
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.com
WORKDIR /peach
ADD Gemfile /peach
ADD Gemfile.lock /peach
ADD vendor/cache.tar.gz /peach/vendor/
ADD vendor/rspec_api_documentation.tar.gz /peach/vendor/ 
RUN bundle config set --local without 'development test'
RUN bundle install --local

ADD peach-*.tar.gz ./
ENTRYPOINT bundle exec puma
