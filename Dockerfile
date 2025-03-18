FROM ruby:3.3.6

RUN mkdir -p /etc/nginx/ssl/ \
    && openssl dhparam -out /etc/nginx/ssl/dhparam.pem 2048 \
    && chmod 600 /etc/nginx/ssl/dhparam.pem

RUN apt clean \
    && apt update -qq \
    && apt install -y build-essential apt-utils libpq-dev sudo unzip gsfonts ghostscript libbz2-dev zlib1g-dev ocrmypdf tesseract-ocr-por poppler-utils nginx libvips \
    && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man \
    && rm /var/log/nginx/access.log \
    && rm /var/log/nginx/error.log \
    && rm /etc/nginx/sites-enabled/default \
    && ln -s /dev/stdout /var/log/nginx/access.log \
    && ln -s /dev/stderr /var/log/nginx/error.log \
    && ln -s /rails/nginx.conf /etc/nginx/sites-enabled/ib \
    && apt clean

WORKDIR /rails

ARG UID=1001
ARG GID=1002

RUN groupadd -g "${GID}" ruby \
  && useradd --create-home --no-log-init -u "${UID}" -g "${GID}" ruby \
  && chown ruby:ruby -R /rails \
  && adduser ruby sudo \
  && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ruby

RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/home/ruby/.bun/bin:${PATH}"

ENV RAILS_ENV=production
ENV RACK_ENV=production
ENV ON_PREMISE=1

RUN gem update --system
RUN gem install bundler:2.5.6
RUN bundle config --global frozen 1
RUN bundle config set without 'development test'

COPY --chown=ruby:ruby Gemfile* .ruby-version ./
ENV BUNDLE_PATH=/usr/local/bundle
COPY Gemfile Gemfile.lock ./
RUN bundle config set deployment 'true'
RUN bundle config set without 'development test'
RUN bundle install

COPY --chown=ruby:ruby package.json bun.lockb ./
RUN bun install --frozen-lockfile

RUN bun install sass


COPY --chown=ruby:ruby . .
RUN SECRET_KEY_BASE_DUMMY=1 RAILS_ENV=production bundle exec rails assets:precompile

ENV RAILS_SOCKET=/rails/puma.sock

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server"]