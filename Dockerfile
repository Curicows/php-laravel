ARG phpVersion=8.5

FROM serversideup/php:${phpVersion}-fpm-nginx AS base

WORKDIR /var/www/html

USER root

# Install extensions
RUN install-php-extensions exif gd intl imagick

# Clear cache
RUN rm -rf /var/cache/apt/*

USER www-data

FROM base AS node

ARG nodeVersion=24

WORKDIR /var/www/html

USER root

RUN apt update

# Install extensions
RUN install-php-extensions exif gd intl imagick

# Install Node
RUN curl -sL https://deb.nodesource.com/setup_${nodeVersion}.x | bash -
RUN apt install -y nodejs
RUN npm install yarn --global

# Clear cache
RUN rm -rf /var/cache/apt/*

USER www-data

FROM node as chrome

USER root

RUN apt update

# Install chromium
RUN apt install libx11-xcb1 libxcomposite1 libatk1.0-0 libatk-bridge2.0-0 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 libnss3 libasound2 -y
RUN npx puppeteer browsers install chrome

# Install puppeteer to chrome
RUN yarn add puppeteer --global

# Clear cache
RUN rm -rf /var/cache/apt/*

USER www-data
