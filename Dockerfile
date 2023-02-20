FROM wordpress:6.1.1-php8.2-fpm-alpine as builder
RUN apk add --no-cache nss-tools caddy supervisor

FROM builder as runtime
COPY caddy/Caddyfile /etc/caddy/
COPY php/php.ini /usr/local/etc/php/conf.d/zz-php-settings.ini
COPY php/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY supervisord/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 80/tcp 443/tcp 443/udp
CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
