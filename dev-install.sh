#!/usr/bin/env bash
set -e
composer install --optimize-autoloader
php artisan key:generate
php artisan migrate
php artisan db:seed
if [ -f package.json ]; then
    yarn install
    yarn build:prod
fi
