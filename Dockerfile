FROM ubuntu:latest

# Define a versão do php
ARG PHP_VER=7.3

# Instala todas dependencias necessárias
RUN echo $PHP_VER >> /PHP_VERSION && \
mkdir /app && \
mkdir /run/app && \
apt-get update -yq && \
apt-get upgrade -yq && \
apt-get install -yq software-properties-common&& \
add-apt-repository ppa:ondrej/php && \
apt-get install -yq nginx \
                    php$PHP_VER \
                    php$PHP_VER-cli \
                    php$PHP_VER-common \
                    php$PHP_VER-curl \
                    php$PHP_VER-fpm \
                    php$PHP_VER-json \
                    php$PHP_VER-mysql \
                    php$PHP_VER-mysqli \
                    php$PHP_VER-opcache \
                    php$PHP_VER-readline \
                    php$PHP_VER-xml \
                    php$PHP_VER-xsl \
                    php$PHP_VER-gd \
                    php$PHP_VER-intl \
                    php$PHP_VER-bz2 \
                    php$PHP_VER-bcmath \
                    php$PHP_VER-gd \
                    php$PHP_VER-mbstring \
                    php$PHP_VER-zip \
                    php$PHP_VER-odbc \
                    php$PHP_VER-interbase \
                    php$PHP_VER-ldap \
                    php$PHP_VER-tidy \
                    php-tcpdf \
                    php-redis \
                    php-imagick \
                    && \
apt-get clean -y && \
echo Done

# Copia os arquivos básicos do nginx
COPY ./nginx/ /etc/nginx/
# Copia arquivos básicos do php
COPY ./php/www.conf /etc/php/$PHP_VER/fpm/pool.d/
COPY ./php/php-fpm.conf ./php/php.ini /etc/php/$PHP_VER/fpm/
# Copia o script de start para a raiz
COPY ./scripts/boot.sh /boot.sh
# Define a raiz do ftp como um volume
COPY ./app /var/www/html
VOLUME ["/var/www/html"]
# Expoêm a porta 80
EXPOSE 80
# Roda o boot.sh
CMD ["/bin/bash", "boot.sh"]
