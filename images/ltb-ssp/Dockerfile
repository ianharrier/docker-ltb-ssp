FROM alpine:3.7

MAINTAINER Ian Harrier <github@harrier.us>

#-------------------------------------------------------------------------------
#  Apache
#-------------------------------------------------------------------------------

RUN set -ex \
        && apk --no-cache add \
               apache2 \
        && sed -i 's/^ServerTokens .*/ServerTokens Prod/g' /etc/apache2/httpd.conf \
        && sed -i 's/^ServerSignature .*/ServerSignature Off/g' /etc/apache2/httpd.conf \
        && sed -i 's/^#ServerName .*/ServerName localhost/g' /etc/apache2/httpd.conf \
        && ln -sf /dev/stdout /var/log/apache2/access.log \
        && ln -sf /dev/stderr /var/log/apache2/error.log \
        && mkdir -p /run/apache2

#-------------------------------------------------------------------------------
#  PHP
#-------------------------------------------------------------------------------

RUN set -ex \
        && apk --no-cache add \
               php7-apache2 \
               php7 \
               php7-ldap \
               php7-mbstring \
               php7-mcrypt \
               php7-openssl \
               php7-session \
               php7-xml \
        && sed -i 's/^expose_php = .*/expose_php = Off/g' /etc/php7/php.ini \
        && sed -i 's/DirectoryIndex /DirectoryIndex index.php /g' /etc/apache2/httpd.conf

#-------------------------------------------------------------------------------
#  Self Service Password (https://github.com/ltb-project/self-service-password)
#-------------------------------------------------------------------------------

ARG SSP_VERSION

WORKDIR /srv/www/app

RUN set -ex \
        && apk --no-cache add \
               ca-certificates \
               curl \
               tar \
        && curl --location --retry 3 \
               https://github.com/ltb-project/self-service-password/archive/v${SSP_VERSION}.tar.gz \
             | tar -xz --strip-components=1 --no-same-owner \
        && sed -i 's|/var/www/localhost/htdocs|/srv/www/app|g' /etc/apache2/httpd.conf \
        && echo 'TLS_CACERT /etc/ssl/certs/ca-certificates.crt' >> /etc/openldap/ldap.conf \
        && apk --no-cache del \
               curl \
               tar

EXPOSE 80

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

#-------------------------------------------------------------------------------
#  Scripts
#-------------------------------------------------------------------------------

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN set -ex \
        && chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]
