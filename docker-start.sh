#!/usr/bin/env bash
set -e

php artisan migrate --force --seed
php artisan config:cache
php artisan route:cache
php artisan view:cache

touch /var/www/html/storage/logs/laravel.log
chmod 666 /var/www/html/storage/logs/laravel.log

php-fpm --daemonize

tail -f /var/www/html/storage/logs/laravel.log &
nginx -g "daemon off;"
