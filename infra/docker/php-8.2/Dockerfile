ARG DEBIAN_FRONTEND=noninteractive
ARG APTGET_ARGS="--no-install-recommends -y"

FROM php:8.2.3-fpm-bullseye AS build
ARG DEBIAN_FRONTEND
ARG APTGET_ARGS

RUN apt-get update && apt-get $APTGET_ARGS install \
        libicu-dev \
    && apt-get $APTGET_ARGS clean

RUN docker-php-ext-install \
    intl \
    pdo_mysql \
    opcache

RUN pecl install \
        xdebug-3.2.0 \
    && docker-php-ext-enable \
        xdebug

RUN strip --strip-debug \
        /usr/local/lib/php/extensions/no-debug-non-zts-20220829/*.so \
    && strip \
        /usr/local/bin/php \
        /usr/local/sbin/php-fpm

FROM debian:bullseye-slim
LABEL maintainer="Alessandro Astarita <aleast@caprionline.it>"
ARG DEBIAN_FRONTEND
ARG APTGET_ARGS

COPY --from=build /usr/local/bin/php /usr/local/bin/php
COPY --from=build /usr/local/sbin/php-fpm /usr/local/sbin/php-fpm
COPY --from=build /usr/local/lib/php/extensions/no-debug-non-zts-20220829 /usr/local/lib/php/extensions/no-debug-non-zts-20220829
COPY --from=build /usr/local/etc /usr/local/etc

RUN apt-get update && apt-get $APTGET_ARGS install \
        libxml2 \
        libonig5 \
        libargon2-1 \
        libsodium23 \
        \
        ca-certificates \
        procps \
        net-tools \
        dialog \
        sudo \
        telnet \
        ssh \
        wget \
        curl \
        bzip2 \
        unzip \
        vim \
        less \
        mariadb-client \
        pv \
        diffutils \
        diffstat \
        patch \
        git \
    && apt-get $APTGET_ARGS clean

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && curl -1sLf https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh | bash \
    && apt-get $APTGET_ARGS clean

RUN apt-get update && apt-get $APTGET_ARGS install \
        nodejs \
        symfony-cli \
    && apt-get $APTGET_ARGS clean

RUN curl -sSk https://getcomposer.org/installer | php -- --install-dir /usr/local/bin --filename composer \
    && npm install -g yarn

RUN useradd -u 1000 -G sudo -s /bin/bash -m dev \
    && echo root:dev | chpasswd \
    && echo dev:dev | chpasswd

STOPSIGNAL SIGTERM
EXPOSE 9000
CMD /usr/local/sbin/php-fpm -F
