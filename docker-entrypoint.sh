#!/bin/bash
set -e

rm -f tmp/pids/server.pid  

bundle install
./bin/yarn install

exec "$@"