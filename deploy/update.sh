#!/bin/bash
sudo -R chown -R www-data: cd /var/www/html/
cd /var/www/html/
sudo -H -u www-data composer install
sudo -H -u www-data php artisan key:generate
sudo -H -u www-data php artisan migrate

