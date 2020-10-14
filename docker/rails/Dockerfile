FROM ruby:2.7.1

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update -qq \
    && apt-get install -y nodejs yarn imagemagick

WORKDIR /app

COPY package.json .
COPY yarn.lock .
RUN yarn install

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install -j4

COPY . /app

RUN bundle exec rails assets:precompile
