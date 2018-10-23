#!/bin/bash
sudo -R chown -R www-data: cd /var/www/html/
cd /var/www/html/
sudo -u www-data composer install
sudo -u www-data php artisan migrate
