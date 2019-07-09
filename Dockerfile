FROM nginx:1.17

LABEL maintainer="Boyd Lamers <boyd@webbits.nl>"

ENV PROXY_REQUESTS_PER_SECOND_LIMIT 10
ENV PROXY_BURST 50
ENV PROXY_PASS_URL https://api.ipify.org/?format=json

ADD nginx.conf /etc/nginx/nginx-proxy.conf

ADD entry.sh /entry.sh

WORKDIR /

RUN ["chmod", "+x", "/entry.sh"]

CMD ["/entry.sh"]