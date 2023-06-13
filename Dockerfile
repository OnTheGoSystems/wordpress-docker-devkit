# Use the official WordPress image as a parent image
FROM wordpress:latest

# Install Xdebug
RUN pecl install xdebug

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Copy xdebug.ini into the container
COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# Bonus: Copy phpinfo.php into the container
COPY phpinfo.php /var/www/html/phpinfo.php
