FROM php:7.0-apache
RUN apt-get install -y php7.2
RUN command -v php

# Composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer && \
    composer self-update --preview
RUN command -v composer

# PHPUnit
RUN wget https://phar.phpunit.de/phpunit.phar
RUN chmod +x phpunit.phar
RUN mv phpunit.phar /usr/local/bin/phpunit
RUN command -v phpunit

RUN docker-php-ext-install mysqli
COPY php.ini /usr/local/etc/php/  
COPY /css/ /var/www/html/css/
COPY /images/ /var/www/html/images/
COPY /js/ /var/www/html/js/
COPY about.php /var/www/html/
COPY account.php /var/www/html/
COPY admin.php /var/www/html/
COPY admin-update.php /var/www/html/
COPY bolt.sql /var/www/html/
COPY bolt-new-phpmyadmin.sql /var/www/html/
COPY php.ini /var/www/html/
COPY cart.php /var/www/html/
COPY config.php /var/www/html/
COPY contact.php /var/www/html/
COPY humans.txt /var/www/html/
COPY index.php /var/www/html/
COPY insert.php /var/www/html/
COPY login.php /var/www/html/
COPY logout.php /var/www/html/
COPY orders.php /var/www/html/
COPY products.php /var/www/html/
COPY orders-update.php /var/www/html/
COPY register.php /var/www/html/
COPY robots.txt /var/www/html/
COPY success.php /var/www/html/
COPY update.php /var/www/html/
COPY update-cart.php /var/www/html/
COPY verify.php /var/www/html/


COPY /vendor/ /var/www/html/vendor/
COPY /UnitTestFiles/ /var/www/html/UnitTestFiles/
COPY composer-setup.php /var/www/html/
COPY composer.json /var/www/html/
COPY composer.lock /var/www/html/
