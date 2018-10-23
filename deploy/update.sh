#!/bin/bash

sudo cp /var/www/html.bak/.env  /var/www/deploy-latest/.env
sudo chown -R www-data:  /var/www/deploy-latest
sudo mv /var/www/deploy-latest /var/www/deploy-$DEPLOYMENT_ID
cd /var/www/deploy-$DEPLOYMENT_ID
sudo -H -u www-data composer install
sudo -H -u www-data php artisan key:generate
sudo -H -u www-data php artisan migrate
sudo -H -u www-data ln -sfn /var/www/deploy-$DEPLOYMENT_ID /var/www/html


