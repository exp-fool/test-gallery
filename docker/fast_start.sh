#!/bin/bash

./build.sh
docker-compose up -d
docker-compose exec app composer install
docker-compose exec app composer dumpautoload
sudo chmod 777 ../storage/ -R
docker-compose exec app php artisan jwt:secret
docker-compose exec app php artisan migrate:fresh
docker-compose exec app php artisan db:seed
docker-compose exec app php artisan storage:link
php artisan db:seed --class=AdminUserSeeder
