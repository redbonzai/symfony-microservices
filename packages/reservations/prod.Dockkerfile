# Use an official PHP image with FPM for production
FROM php:8.3-fpm

# Set the working directory
WORKDIR /var/www

# Install system dependencies
RUN apt-get update && apt-get install -y \
        libonig-dev \
        libzip-dev \
        zip \
        git \
        unzip

# Install Composer globally
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy the application code to the container
COPY ./packages/auth /var/www

# Run Composer to install dependencies
RUN composer install --no-dev --optimize-autoloader

# Clean up cache and temporary files
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose the port PHP-FPM is listening on
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm"]
