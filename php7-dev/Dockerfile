#If you want to use the shell files provided in this folder, you shall run the following command :
#docker build -t php7-dev .
FROM jeremylempereur/php-tools:7
MAINTAINER Jeremy Lempereur

#Switch to root user to install pecl
USER root

#XDEBUG
RUN pecl install xdebug
RUN echo "zend_extension=xdebug.so\nxdebug.cli_color=1\nxdebug.remote_autostart=1\nxdebug.remote_connect_back=1" > /usr/local/etc/php/conf.d/xdebug.ini

#Switch back to user www-data
USER www-data