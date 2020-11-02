#!/bin/bash

set -e

/opt/payara41/bin/asadmin start-domain
/opt/payara41/bin/asadmin create-jdbc-connection-pool --datasourceclassname=org.postgresql.ds.PGSimpleDataSource --restype=javax.sql.DataSource --property="user=mortal2017:password=prn335:url='jdbc:postgresql://postgres:5432/posts':portNumber=5432:dataBaseName=posts:driverClass=org.postgresql.Driver:serverName=postgres" pool_post --user admin --passwordfile=/opt/payara41/pwd.txt 
/opt/payara41/bin/asadmin create-jdbc-resource --connectionpoolid pool_post jdbc_post --user admin --passwordfile=/opt/payara41/pwd.txt
/opt/payara41/bin/asadmin stop-domain

${PAYARA_PATH}/generate_deploy_commands.sh && ${PAYARA_PATH}/bin/asadmin start-domain -v --postbootcommandfile ${DEPLOY_COMMANDS} ${PAYARA_DOMAIN}