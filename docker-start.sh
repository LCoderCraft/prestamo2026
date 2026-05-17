#!/usr/bin/env bash
set -e

if [ -z "$APP_KEY" ] || [ "$APP_KEY" = "SomeRandomString" ]; then
  export APP_KEY=$(php artisan key:generate --show)
fi

php artisan migrate --force --seed
php artisan config:cache
php artisan route:cache
php artisan view:cache

touch /var/www/html/storage/logs/laravel.log
chmod 666 /var/www/html/storage/logs/laravel.log

php-fpm --daemonize

nginx -g "daemon off;"
