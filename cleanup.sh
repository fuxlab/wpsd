#!/bin/bash

#
# This file should be used to clean up your complete local setup
# this will delete all files in that folders, be careful with it!
#

# 1. Check if .env file exists
if [ -e .env ]; then
  source .env
else 
  echo "Please set up your .env file before starting your enviornment."
  exit 1
fi

# stop containers
docker-compose stop

if [ ! -z "$NGINX_FILES_PATH" ] && [ -d "$NGINX_FILES_PATH" ]; then
  echo "clean nginx & delete empty folders" 
  rm -r -- "$NGINX_FILES_PATH"/*/
  find "$NGINX_FILES_PATH" ! -name '.gitignore' -type f -exec rm -f {} +
fi

if [ ! -z "$DB_PATH" ] && [ -d "$DB_PATH" ]; then
  rm -r -- "$DB_PATH"/*/
  find "$DB_PATH" ! -name '.gitignore' -type f -exec rm -f {} +
fi

if [ ! -z "$WP_PATH" ] && [ -d "$WP_PATH" ]; then
  rm -r -- "$WP_PATH"/*/
  find "$WP_PATH" ! -name '.gitignore' -type f -exec rm -f {} +
fi

# delete containers
docker-compose rm

exit 0
