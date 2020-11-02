#!/bin/bash

set -e

# Recrea todo lo relacionado al codigo

# rm -rf codigo/

# mkdir codigo/

# cp -r /home/carlos/NetBeansProjects/parcial3server-cliente codigo/RestserverClient
# cp -r /home/carlos/NetBeansProjects/parcial3server codigo/RestServer


# Compila la app y las mete en imagenes

mvn package -f codigo/RestserverClient
cp codigo/RestserverClient/target/*.war payara-client/parcial3server-cliente-1.0-SNAPSHOT.war
cp codigo/RestServer/target/*.war payara-client/parcial3server-1.0-SNAPSHOT.war

mvn package -f codigo/RestServer
cp codigo/RestServer/target/*.war payara-server/parcial3server-1.0-SNAPSHOT.war
cp codigo/RestserverClient/target/*.war payara-server/parcial3server-cliente-1.0-SNAPSHOT.war


# Se hace deploy al app

docker-compose build
docker-compose up
