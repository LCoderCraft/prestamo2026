FROM node:22-bookworm AS node-builder

WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM php:8.3-fpm-bookworm AS base

RUN apt-get update && apt-get install -y \
    nginx \
    libpq-dev \
    libpng-dev \
    libzip-dev \
    unzip \
    curl \
    git \
    && docker-php-ext-install pdo_pgsql pgsql gd zip bcmath \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY . /var/www/html
WORKDIR /var/www/html

COPY --from=node-builder /app/public/build /var/www/html/public/build

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 storage bootstrap/cache \
    && composer install --no-dev --optimize-autoloader --no-interaction \
    && php artisan storage:link --force

COPY deploy.conf /etc/nginx/sites-enabled/default

EXPOSE 80

COPY docker-start.sh /usr/local/bin/docker-start.sh
RUN chmod +x /usr/local/bin/docker-start.sh
CMD ["/usr/local/bin/docker-start.sh"]
