#!bin/bash

echo '------------------------------------------------------------'
echo '                  Sauvegarde container !                    '
echo '------------------------------------------------------------'

docker commit web_phpmyadmin_1 svg_phpmyadmin

docker commit web_apachephp_1 svg_apache

docker commit web_mysql_1 svg_mysql

echo '------------------------------------------------------------'
echo '                  Sauvegarde des images !                   '
echo '------------------------------------------------------------'

docker save svg_mysql > svg_mysql.tar

docker save svg_apache > svg_apache.tar

docker save svg_phpmyadmin > svg_phpmyadmin.tar

echo '------------------------------------------------------------'
echo '               Suppression des images !                     '
echo '------------------------------------------------------------'

docker rmi -f svg_mysql

docker rmi -f svg_apache

docker rmi -f svg_phpmyadmin

echo '------------------------------------------------------------'
echo '                      Sauvegarde MYSQL                      '
echo '------------------------------------------------------------'


dump= docker exec -i web_mysql_1 mysqldump --all-databases -uroot -proot > backup.sql 

echo ' '

echo 'Sauvegarde de la base MYSQL éffectué'
