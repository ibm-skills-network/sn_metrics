FROM icr.io/skills-network/ruby:3.1.2 as builder

ENV APP_HOME /app
ENV RAILS_ENV production

WORKDIR /app

USER root

# Install Gem
COPY Gemfile Gemfile.lock ./
RUN apk add --no-cache --virtual build_deps \
      git && \
    apk add bind-tools \
      gcompat \
      build-base && \
    apk add --no-cache \
      postgresql-dev && \
    bundle install --jobs="$(nproc --all)" \
      --frozen \
      --retry 3 \
      -j4 \
      --without development test && \
    rm -rf /usr/local/bundle/bundler/gems/*/.git \
      /usr/local/bundle/cache/ && \
    rm -rf /var/cache/apk/* && \
    apk del build_deps

COPY bin ./bin
COPY config ./config
COPY db ./db
COPY lib ./lib
COPY public ./public
COPY vendor ./vendor
COPY app/components ./app/components
COPY app/inputs ./app/inputs
COPY app/views ./app/views
COPY app/assets ./app/assets
COPY app/javascript ./app/javascript
COPY app/models ./app/models

# Config files
COPY Rakefile config.ru ./
COPY .browserslistrc *.config.js ./

# Compile/transpile static assets
# Added SECRET_KEY_BASE=dummysecret as it fixes an error in the assets:precompile job
RUN SECRET_KEY_BASE=dummysecret \
    bundle exec bin/rake assets:precompile

COPY app ./app

USER 1001

# Production image build
FROM icr.io/skills-network/ruby:3.1.2 as release
USER root
ENV APP_HOME /app

RUN apk add --no-cache \
      tzdata \
      file \
      libpq \
      bind-tools && \
    rm -rf /var/cache/apk/*
COPY --from=builder /usr/local/bundle/ /usr/local/bundle/
COPY --from=builder $APP_HOME $APP_HOME

WORKDIR $APP_HOME
USER 1001
ENTRYPOINT ["bin/rails"]
CMD ["server", "-b", "0.0.0.0"]

# Default to `release`
FROM release as monkey-patched
USER root

ENV APP_HOME /app
ENV RAILS_ENV production

ENV USER=skillsnetwork
ENV UID=1001
RUN adduser --disabled-password --gecos --ingroup $USER --no-create-home --uid $UID $USER
RUN chown -R $USER:$USER $APP_HOME

RUN apk upgrade --update-cache \
    libpq \
    expat \
    bind-libs\
    bind-tools\
  && rm -rf /var/cache/apk/*

USER 1001
