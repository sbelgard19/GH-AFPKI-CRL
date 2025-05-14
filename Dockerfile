#CRL

# CHAINGUARD "base images"
# FROM cgr.dev/chainguard/wolfi-base:latest

ARG BASE_REGISTRY=cgr.dev
ARG BASE_IMAGE=chainguard/wolfi-base
ARG BASE_TAG="latest"

# MAIN FROM...
FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG}

# NGINX
RUN apk add nginx

# needed for client_body
RUN mkdir /var/lib/nginx/tmp/

RUN adduser -D nginx
COPY nginx.conf       /etc/nginx/nginx.conf

COPY index.html      /usr/share/nginx/html/index.html
COPY sample.crl        /usr/share/nginx/html/sample.crl

EXPOSE 80
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
