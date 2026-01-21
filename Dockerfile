# ---------- Stage 1: Build (Composer + Node + Vite) ----------
FROM php:8.2-fpm AS build

# 🔑 DISABLE BROADCASTING DURING BUILD
ENV BROADCAST_DRIVER=log
ENV QUEUE_CONNECTION=sync
ENV CACHE_STORE=array
ENV SESSION_DRIVER=array

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git unzip curl \
    nodejs npm \
    libpng-dev libjpeg-dev libfreetype6-dev \
    libxml2-dev libzip-dev libonig-dev \
    libicu-dev zlib1g-dev libpq-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Install PHP extensions needed for Composer packages
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd pdo pdo_mysql mbstring exif bcmath zip intl

# Set working directory
WORKDIR /var/www/html

# Copy application source
COPY ./ ./

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# Install Node deps and build Vite assets
RUN npm install && npm run build


# ---------- Stage 2: Production ----------
FROM php:8.2-fpm

# Install required system dependencies for PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libxml2-dev \
    libzip-dev \
    libonig-dev \
    libicu-dev \
    zlib1g-dev \
    libpq-dev \
    imagemagick \ 
    libmagickwand-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP Imagick extension
RUN pecl install imagick \
    && docker-php-ext-enable imagick
    
# Install Composer in production stage (your request)
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install \
        gd \
        pdo \
        pdo_mysql \
        mbstring \
        exif \
        bcmath \
        zip \
        intl

WORKDIR /var/www/html

# Copy built application
COPY --from=build /var/www/html ./

# Permissions
RUN chown -R www-data:www-data storage bootstrap/cache

CMD ["php-fpm"]
