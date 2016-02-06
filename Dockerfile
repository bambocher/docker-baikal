FROM alpine:3.2
MAINTAINER Dmitry Prazdnichnov <dp@bambucha.org>

RUN apk --update add unzip lighttpd php-cgi php-ctype php-dom php-pdo_sqlite php-pdo_mysql php-xml \
    && rm -rf /var/cache/apk/*

ENV VERSION		0.2.7
ENV CHECKSUM	2019847ca649dcdc4155a3675a5cddfc

RUN wget -O baikal-flat.zip http://baikal-server.com/get/baikal-flat-$VERSION.zip \
    && echo "$CHECKSUM  baikal-flat.zip" | md5sum -c - \
    && unzip baikal-flat.zip \
    && rm baikal-flat.zip \
    && mv baikal-flat /baikal \
    && chmod 755 /baikal \
    && chown -R lighttpd:lighttpd /baikal \
    && sed -i -e "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php/php.ini

ADD lighttpd.conf /etc/lighttpd/lighttpd.conf

EXPOSE 80

VOLUME /baikal/Specific

ENTRYPOINT ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
