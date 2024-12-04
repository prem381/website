FROM ubuntu
RUN apt-get update -y
RUN apt-get install apache2 -y
ADD ./var/www/html
EXPOSE 8080
ENTRYPOINT apachectl -D FOREGROUND
