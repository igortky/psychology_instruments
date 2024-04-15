#!/bin/bash
set -e

echo $RAILS_ENV

echo 'MIGRATING'
rake db:migrate db:seed


echo 'CLEANING SERVER'
if [ -f tmp/pids/server.pid ]; then
	echo 'CLEANING PID'
	rm tmp/pids/server.pid
fi

bundle exec "$@"
