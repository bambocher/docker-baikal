FROM alpine:3.4
MAINTAINER Dmitry Prazdnichnov <dp@bambucha.org>

ENV VERSION  0.4.5
ENV CHECKSUM 533e46ffcafda24e91aabbbc5873b7d1153d538dde599927f77e1595793ddb3e

ADD baikal.sh /usr/local/bin/baikal

RUN apk --no-cache add unzip openssl lighttpd php5-cgi php5-ctype php5-dom \
        php5-pdo_sqlite php5-pdo_mysql php5-xml php5-openssl php5-json \
        php5-xmlreader \
    && wget https://github.com/fruux/Baikal/releases/download/$VERSION/baikal-$VERSION.zip \
    && echo $CHECKSUM "" baikal*.zip | sha256sum -c - \
    && unzip baikal*.zip \
    && rm baikal*.zip \
    && chmod +x /usr/local/bin/baikal \
    && sed -ie "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php5/php.ini \
    && mkdir /baikal/html/.well-known \
    && apk del -rf --purge openssl unzip

ADD lighttpd.conf /etc/lighttpd/lighttpd.conf

VOLUME /baikal/Specific

EXPOSE 80

ENTRYPOINT ["baikal"]
