#!/bin/bash
echo "Iniciando webserver";

echo "Rodando php: ";
php -v
echo "Rodando nginx: ";
nginx -v

# SET PHP_VER variable in php files
PHPVERSION="$(cat /PHP_VERSION)"
sed -i "s/%PHP_VER%/$PHPVERSION/g" "/etc/php/$PHPVERSION/fpm/pool.d/www.conf"
sed -i "s/%PHP_VER%/$PHPVERSION/g" "/etc/php/$PHPVERSION/fpm/php-fpm.conf"
sed -i "s/%PHP_VER%/$PHPVERSION/g" "/etc/php/$PHPVERSION/fpm/php.ini"

echo "start php";
service php7.3-fpm start
echo "php status";
service php7.3-fpm status

echo "start nginx";
service nginx start;
echo "nginx status";
service nginx status

