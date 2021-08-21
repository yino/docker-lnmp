

#!/bin/bash

##############################

# @file mysql.sh

# @brief create database and tables in mysql

# @author Yino

# @version 0.1

# @date 2013-01-20

##############################

USERNAME=$(awk '/user/{if(NR>=1 && NR<=5)print $3}' /etc/mysql/debian.cnf)

DATABASE="mysql"

HOSTNAME="127.0.0.1"

PORT="3306"

PASSWORD=$(awk '/password/{if(NR>=1 && NR<=5)print $3}' /etc/mysql/debian.cnf)

DBNAME="mysql"

CREATE_USER="yino"

CREATE_PASS="123456"
#update_user_sql="update user set host = '%' where user = 'root';flush privileges;"
update_user_sql="GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;flush privileges;"
create_user_sql="create user ${CREATE_USER}@'%' identified by '${CREATE_PASS}';grant all privileges on *.* to ${CREATE_USER}};
"

######################
## 修改mysql的 仅localhost登陆
mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${create_user_sql}"

echo "mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e \"${create_user_sql}\""

select_user_sql="select host,user from user"
mysql -h${HOSTNAME}  -P${PORT}  -u${USERNAME} -p${PASSWORD} ${DBNAME} -e "${select_user_sql}"