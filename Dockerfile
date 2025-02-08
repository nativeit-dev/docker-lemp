# Use the official Debian image as a base
FROM debian:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list and install necessary packages
RUN apt-get update && \
    apt-get install -y \
    mariadb-server \
    mariadb-client \
    php \
    php-mysql \
    php-cli \
    php-curl \
    php-json \
    php-xml \
    php-mbstring \
    curl \
    git \
    unzip && \
    apt-get clean

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Expose the default MariaDB port
EXPOSE 3306

# Expose the default HTTP port
EXPOSE 80

# Start MariaDB service and PHP
CMD service mysql start && php -S 0.0.0.0:80 -t /var/www/html