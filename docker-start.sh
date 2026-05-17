#!/usr/bin/env bash
set -e

if [ -z "$APP_KEY" ] || [ "$APP_KEY" = "SomeRandomString" ]; then
  export APP_KEY=$(php artisan key:generate --show --force)
fi

php artisan migrate --force --seed
php artisan config:cache
php artisan route:cache
php artisan view:cache

php-fpm --daemonize

nginx -g "daemon off;"
