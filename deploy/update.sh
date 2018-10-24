#!/bin/bash
set -e
sudo cp /var/www/html/.env  /var/www/deploy-latest/.env
sudo chown -R www-data:  /var/www/deploy-latest/
sudo mv /var/www/deploy-latest /var/www/deploy-$DEPLOYMENT_ID
cd /var/www/deploy-$DEPLOYMENT_ID
sudo -H -u www-data composer update
#sudo -H -u www-data php artisan key:generate
# Clear any previous cached views
sudo -H -u www-data php artisan migrate
# Clear any previous cached views
sudo -H -u www-data php artisan config:clear
sudo -H -u www-data php artisan cache:clear
sudo -H -u www-data php artisan view:clear

# Opimize the application
sudo -H -u www-data php artisan config:cache
sudo -H -u www-data php artisan auth:clear-resets
sudo -H -u www-data ln -sfn /var/www/deploy-$DEPLOYMENT_ID /var/www/html
sudo service php7.2-fpm reload
