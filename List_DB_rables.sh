#!/bin/bash
MYSQL_CMD="sudo /usr/bin/mysql --defaults-file=/etc/mysql/debian.cnf"
for db in `$MYSQL_CMD -e "show databases;" | grep -v 'Database' | grep -Ev 'sys|PERCONA_SCHEMA|information_schema|#mysql50#keyring-data|performance_schema|mysql'` 
do 
	 echo -e "\n#######  $db #######\n"
        #`$MYSQL_CMD -e "use $db;" -e "show tables;" | tail | grep -v Tables_in` 
	
	  for tb in `$MYSQL_CMD -e "use $db;" -e "show tables;" | tail -500| grep -v "Tables_in"`
	  do 
	     echo "$MYSQL_CMD -e \"ALTER TABLE $db.$tb ENCRYPTION='Y';"\"
	  done

done
