FROM php:apache
MAINTAINER Piotr Łuczak <piotrluczak1995@gmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
	imagemagick \
	libav-tools \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libpng12-dev \
	patch \
	unzip \
	&& apt-get clean

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
	docker-php-ext-install gd && \
	docker-php-ext-install exif

ENV HA5I_VERSION="0.29.0"
RUN curl -L https://release.larsjung.de/h5ai/h5ai-${HA5I_VERSION}.zip > /usr/src/h5ai-latest.zip && \
	unzip /usr/src/h5ai-latest.zip && \
	rm -f /usr/src/h5ai-latest.zip

VOLUME /var/www/html/_h5ai/private/conf

RUN echo "DirectoryIndex  index.html  index.php  /_h5ai/public/index.php" > /etc/apache2/conf-enabled/h5ai.conf

RUN chown www-data:www-data /var/www/html/_h5ai/private/cache && \
	chown www-data:www-data /var/www/html/_h5ai/public/cache