FROM circleci/ruby:2.6.6-node-browsers

USER root

RUN postgresqlDeps='wget gnupg' \
  set -x \
  && apt-get update \
  && apt-get install -y $postgresqlDeps --no-install-recommends \
  && wget --quiet -O - https://deb.nodesource.com/setup_10.x | bash - \
  && echo 'deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main' >  /etc/apt/sources.list.d/pgdg.list \
  && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && apt-get update \
  && apt-get install -y tzdata postgresql-client-12 --no-install-recommends

RUN sudo mkdir -p /app

RUN gem update --system	
RUN gem install bundler

ENV NODE_ENV=development
ENV RAILS_ENV=development
ENV WEBPACKER_DEV_SERVER_HOST=0.0.0.0
ENV WEBPACKER_DEV_SERVER_PORT=3035
ENV WEBPACKER_DEV_SERVER_PUBLIC=0.0.0.0:3035
ENV BUNDLE_APP_CONFIG=/app/.bundle/
ENV PATH=/app/bin:$PATH

WORKDIR /app

EXPOSE 3000

ENTRYPOINT ["/app/docker-entrypoint.sh"]