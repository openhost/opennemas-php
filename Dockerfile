# PHPUnit Docker Container.
FROM alpine:3.11
LABEL mantainer="Opennemas Developers Team <developers@opennemas.com>"

WORKDIR /tmp

RUN apk --no-cache add \
        bash \
        openssh-client \
        ca-certificates \
        curl \
        gcc \
        gettext \
        git \
        make \
        libc-dev \
        php7 \
        php7-bcmath \
        php7-ctype \
        php7-curl \
        php7-dom \
        php7-exif \
        php7-fileinfo \
        php7-gettext \
        php7-iconv \
        php7-intl \
        php7-json \
        php7-mbstring \
        php7-mcrypt \
        php7-mysqli \
        php7-opcache \
        php7-openssl \
        php7-pcntl \
        php7-pdo \
        php7-pdo_mysql \
        php7-pdo_pgsql \
        php7-pdo_sqlite \
        php7-phar \
        php7-redis \
        php7-session \
        php7-simplexml \
        php7-soap \
        php7-tokenizer \
        php7-xdebug \
        php7-xml \
        php7-xmlreader \
        php7-xmlwriter \
        php7-zip \
        php7-zlib \
        ruby \
        ruby-etc \
        ruby-dev \
        tar \
        unzip \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/bin --filename=composer \
    && php -r "unlink('composer-setup.php');"

RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/v3.8/main/ nodejs=8.14.0-r0 \
        --repository http://dl-cdn.alpinelinux.org/alpine/v3.8/main/ npm=8.14.0-r0

RUN gem install fpm

RUN echo "zend_extension=xdebug.so" >> /etc/php7/conf.d/xdebug.ini

VOLUME ["/app"]
WORKDIR /app
