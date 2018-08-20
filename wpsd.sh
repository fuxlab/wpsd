#!/bin/bash

proxy_env="./_lib/proxy/.env"
wp_env="./_lib/wp/.env"

if [[ "$@" == "setup" ]]; then
  echo "WPSD: Run Setup.."

  curl https://raw.githubusercontent.com/jwilder/nginx-proxy/master/nginx.tmpl > nginx/nginx.tmpl

  docker-compose pull
  
  if [ ! -f "$proxy_env" ]; then
    cp "$proxy_env.sample" "$proxy_env"
    echo "WPSD: created proxy env."
  fi
  
  if [ ! -f "$wp_env" ]; then
    cp "$wp_env.sample" "$wp_env"
    echo "WPSD: created wp env."
  fi

  docker network create webproxy

  echo "WPSD: setup finished."
  echo "WPSD: remember to change variables .env files in _lib/proxy & _lib/wp."
  exit 1
fi


# regular run
if [ ! -f "$proxy_env" ]; then
  echo "WPSD: proxy env file not found! please run setup first."
fi

if [ ! -f "$wp_env" ]; then
  echo "WPSD: wp env file not found! please run setup first."
fi

if [ ! -f "$proxy_env" ] || [ ! -f "$wp_env" ]; then
  echo "WPSD: exited gracefully."
  exit 1
fi


# with options
if [[ "$@" == "start" ]]; then
  echo "WPSD: starting.."

  cd _lib/proxy && docker-compose up -d
  echo "WPSD: proxy started."

  cd ../..

  cd _lib/wp && docker-compose up -d
  echo "WPSD: wordpress started"

  echo "WPSD: started."
elif [[ "$@" == "stop" ]]; then
  cd _lib/proxy && docker-compose stop
  echo "WPSD: proxy stopped"
  
  cd ../..
  cd _lib/wp && docker-compose stop
  echo "WPSD: wordpress stopped"

  echo "WPSD: stopped."
else
  echo "WPSD: Please give me some params to do something. Try 'setup', 'start' or 'stop'."
fi