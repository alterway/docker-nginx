FROM debian:jessie

MAINTAINER Alterway (iac@alterway.fr)

ENV NGINX_VERSION release-1.9.5

RUN apt-get update \
	&& apt-get install -y \
		gcc \
		make \
		libpcre3-dev \
		zlib1g-dev \
		libldap2-dev \
		libssl-dev \
		ca-certificates \
		git

RUN mkdir /etc/nginx && \
	mkdir -p /var/www/html && \
	cd /usr/src/ && \
	git clone https://github.com/kvspb/nginx-auth-ldap.git  && \
	git clone https://github.com/nginx/nginx.git -b ${NGINX_VERSION} && \
	cd /usr/src/nginx && \
	./auto/configure \
		--add-module=/usr/src/nginx-auth-ldap \
		--with-http_ssl_module \
		--with-debug \
		--conf-path=/etc/nginx/nginx.conf \ 
		--sbin-path=/usr/bin/nginx \
		--pid-path=/var/run/nginx.pid \
		--error-log-path=/dev/sdterr \
		--http-log-path=/dev/stdout && \
	make install  && \
	rm -rf /var/src/nginx-auth-ldap /var/src/nginx

EXPOSE 80 443

WORKDIR /var/www

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

