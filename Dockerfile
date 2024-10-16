FROM alpine:3.20

LABEL maintainer="Andrew Dorokhov <andrew@dorokhov.dev>"
LABEL description="Docker for Laravel with PHP-FPM 8.3 & Nginx 1.26 on Alpine Linux."

# Install necessary packages:
RUN apk add --no-cache \
    nginx~1.26 \
    php83 \
    php83-fpm

# Copy the nginx configuration into the image:
COPY config/nginx/nginx.conf /etc/nginx/nginx.conf

# Copy the default site configuration into the image:
COPY config/nginx/default.conf /etc/nginx/http.d/default.conf

# Copy the PHP configuration file:
COPY config/php/php.ini /etc/php83/php.ini

# Copy the PHP-FPM configuration file:
COPY config/php/php-fpm.conf /etc/php83/php-fpm.conf

# Copy the PHP-FPM pool configuration:
COPY config/php/www.conf /etc/php83/php-fpm.d/www.conf

# Expose port 80 for HTTP
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
