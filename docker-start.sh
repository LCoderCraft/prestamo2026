#!/usr/bin/env bash
set -e

if [ -z "$APP_KEY" ] || [ "$APP_KEY" = "SomeRandomString" ]; then
  php artisan key:generate --force
fi

php artisan migrate --force
php artisan config:cache
php artisan route:cache
php artisan view:cache

php-fpm --daemonize

nginx -g "daemon off;"
