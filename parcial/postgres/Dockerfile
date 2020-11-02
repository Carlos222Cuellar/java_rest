FROM postgres:9.6.3-alpine

ADD posts.sql /docker-entrypoint-initdb.d/posts.sql

EXPOSE 5432
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["postgres"]
