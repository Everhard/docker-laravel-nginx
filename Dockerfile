FROM alpine:3.20

LABEL maintainer="Andrew Dorokhov <andrew@dorokhov.dev>"
LABEL description="Docker for Laravel with PHP-FPM 8.3 & Nginx 1.26 on Alpine Linux."

# Install necessary packages:
RUN apk add --no-cache \
    nginx~1.26 \
    php83

# Copy the nginx configuration into the image:
COPY config/nginx/nginx.conf /etc/nginx/nginx.conf

# Copy the default site configuration into the image:
COPY config/nginx/default.conf /etc/nginx/http.d/default.conf

# Expose port 80 for HTTP
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
