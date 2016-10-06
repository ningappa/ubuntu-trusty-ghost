FROM ubuntu:trusty
MAINTAINER Ningappa <ningappa@poweruphosting.com>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update

RUN set -ex \
  && for key in \
    9554F04D7259F04124DE6B476D5A82AC7E37093B \
    94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
    0034A06D9D9B0064CE8ADF6BF1747F4AD2306D93 \
    FD3A5288F042B6850C66B31F09FE44734EB7990E \
    71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
    DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
    B9AE9905FFD7803F25714661B63B535A4C206CA9 \
    C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
  ; do \
    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
  done

ENV NPM_CONFIG_LOGLEVEL info
ENV NODE_VERSION 4.2.2
ENV GHOST_VERSION 0.11.1

RUN set -x 
RUN apt-get update && apt-get install -y xz-utils gcc  make  python curl unzip ca-certificates --no-install-recommends 
RUN curl -SLO "https://nodejs.org/dist/v4.2.2/node-v4.2.2-linux-x64.tar.xz" 
RUN curl -SLO "https://nodejs.org/dist/v4.2.2/SHASUMS256.txt.asc" 
RUN gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc 
RUN grep " node-v4.2.2-linux-x64.tar.xz\$" SHASUMS256.txt | sha256sum -c - 
RUN tar -xJf "node-v4.2.2-linux-x64.tar.xz" -C /usr/local --strip-components=1 
RUN rm "node-v4.2.2-linux-x64.tar.xz" SHASUMS256.txt.asc SHASUMS256.txt 
RUN apt-get purge -y --auto-remove  xz-utils gcc  make  python curl unzip  
RUN ln -s /usr/local/bin/node /usr/local/bin/nodejs 

RUN cd $(npm root -g)/npm \
	&& npm install fs-extra \
	&& sed -i -e s/graceful-fs/fs-extra/ -e s/fs.rename/fs.move/ ./lib/utils/rename.js
	
ADD uploads/html /var/www/html

RUN apt-get install -y git apache2 php5-cli php5-mysql php5-gd php5-curl php5-sqlite libapache2-mod-php5 mysql-server mysql-client wget unzip supervisor && \
	  apt-get clean && \
	  rm -r /var/lib/apt/lists/*
	
RUN sed -i -e 's/^bind-address\s*=\s*127.0.0.1/#bind-address = 127.0.0.1/' /etc/mysql/my.cnf

RUN apt-get clean && a2enmod rewrite

ADD uploads/pbn	/usr/share/pbn
ADD uploads/html /var/www/html
RUN npm install npm -g 
RUN npm install forever -g
RUN npm install -g node-gyp
RUN cd /var/www/html && npm install --production


RUN chmod 777 /usr/share/pbn/filemanager/config/.htusers.php && \
	echo "IncludeOptional /usr/share/pbn/apache2.conf" >> /etc/apache2/apache2.conf && \
	echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
	rm /var/www/html/index.html && \
	rm -rf /var/lib/mysql/*

ADD uploads/ghost.sql /ghost.sql

ADD uploads/start-apache2.sh /start-apache2.sh
ADD uploads/start-mysqld.sh /start-mysqld.sh
ADD uploads/start-ghost.sh /start-ghost.sh
ADD uploads/create_mysql_admin_user.sh /create_mysql_admin_user.sh
ADD uploads/run.sh /run.sh

RUN chmod 755 /*.sh

ADD uploads/supervisord-apache2.conf /etc/supervisor/conf.d/supervisord-apache2.conf
ADD uploads/supervisord-mysqld.conf /etc/supervisor/conf.d/supervisord-mysqld.conf
ADD uploads/supervisord-ghost.conf /etc/supervisor/conf.d/supervisord-ghost.conf

RUN chown -R www-data:www-data /var/www/
RUN echo "Listen 2083" >> /etc/apache2/ports.conf

#Environment variables to configure php
ENV PHP_UPLOAD_MAX_FILESIZE 10M
ENV PHP_POST_MAX_SIZE 10M

# Add volumes for MySQL 
VOLUME  ["/etc/mysql", "/var/lib/mysql", "/var/www/html" ]

EXPOSE 80 3306 2083
CMD ["/run.sh"]
