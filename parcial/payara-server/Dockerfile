FROM payara/server-full:latest
ENV JDBC_URL=https://jdbc.postgresql.org/download/postgresql-42.1.4.jar
RUN wget --quiet --no-check-certificate $JDBC_URL
RUN cp postgresql-42.1.4.jar /opt/payara41/glassfish/lib/

COPY init.sh /init.sh
COPY pwd.txt /opt/payara41/pwd.txt

USER root
RUN chmod a+x /init.sh
USER payara

ENTRYPOINT /init.sh

COPY parcial3server-1.0-SNAPSHOT.war $DEPLOY_DIR/parcial3server-1.0-SNAPSHOT.war
COPY parcial3server-cliente-1.0-SNAPSHOT.war $DEPLOY_DIR/parcial3server-cliente-1.0-SNAPSHOT.war

