#If you want to use the shell files provided in this folder, you shall run the following command :
#docker build -t php56 .
FROM php:5.6-cli
MAINTAINER Jeremy Lempereur

RUN apt-get update && apt-get install -y \

    git \
    unzip \

    # GD dependencies

    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng12-dev \
    # webp
    libvpx-dev \

    # APC
    php-apc \

    # Type docker-php-ext-install to see available extensions

    && docker-php-ext-install pdo_mysql opcache \

    # GD configure

    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/ --with-vpx-dir=/usr/include/ \
    && docker-php-ext-install gd

# opcache

RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=60'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

RUN echo "realpath_cache_size = 4096k; realpath_cache_ttl = 7200;" > /usr/local/etc/php/conf.d/php.ini

# Set timezone
RUN rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime && \
    "date" \
# PHP Timezone fix : Warning: date_default_timezone_get(): It is not safe to rely on the system's timezone settings.
 && echo "date.timezone = Europe/Paris;" > /usr/local/etc/php/conf.d/php.ini

# www-data user setup
RUN mkdir /var/www && chown www-data:www-data /var/www \

# Change the first user's id to www-data, to avoid file permission errors
&& usermod -u 1000 www-data && groupmod -g 1000 www-data

# Run all commands inside the container as www-data
USER www-data
WORKDIR /var/www
ENV PATH /var/www:$PATH
#COMPOSER
RUN curl -sS https://getcomposer.org/installer | php \
&& chmod a+x composer.phar && mv composer.phar composer

#PHPUNIT
RUN composer require "phpunit/phpunit" \
&& chmod a+x vendor/bin/phpunit && ln -s vendor/bin/phpunit phpunit

#PHPCS
RUN composer require "squizlabs/php_codesniffer=*" \
&& chmod a+x vendor/bin/phpcs && ln -s vendor/bin/phpcs phpcs \
&& chmod a+x vendor/bin/phpcbf && ln -s vendor/bin/phpcbf phpcbf