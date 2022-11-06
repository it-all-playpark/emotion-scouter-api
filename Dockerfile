FROM nginx:1.22.1-alpine
RUN apk update &&\
    apk add -y --no-cache supervisor

COPY server-conf/nginx.conf /etc/nginx/
COPY server-conf/flask-site-nginx.conf /etc/nginx/conf.d/
COPY server-conf/supervisord.conf /etc/supervisor/
COPY entrypoint.sh /

WORKDIR /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]