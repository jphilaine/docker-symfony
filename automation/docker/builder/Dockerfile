FROM php:fpm

RUN apt-get update && apt-get install -y git curl mysql-client unzip

RUN docker-php-ext-install pdo_mysql exif opcache

# Install GD
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

# Setup the Composer installer
RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
  && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
  && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }"

# Install Composer
RUN php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer --snapshot && rm -rf /tmp/composer-setup.php

# Display version information
RUN composer --version

# Install drush
#RUN php -r "readfile('https://s3.amazonaws.com/files.drush.org/drush.phar');" > /usr/local/bin/drush && \
#  chmod +x /usr/local/bin/drush

# Install Drupal Console
#RUN curl https://drupalconsole.com/installer -o /usr/local/bin/drupal && \
#  chmod +x /usr/local/bin/drupal

#RUN composer global require hirak/prestissimo:^0.3 --optimize-autoloader && \
#    rm -rf ~/.composer/.cache && \
#    composer require drupal/console:@stable --prefer-dist --optimize-autoloader && \
#    composer update drupal/console --with-dependencies

RUN usermod -u 1000 www-data

USER www-data

WORKDIR /home/admin/www
