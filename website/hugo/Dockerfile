FROM alpine:latest as build

ENV HUGO_VERSION 0.109.0

RUN wget https://github.com/gohugoio/hugo/releases/latest/download/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    tar -xf hugo_${HUGO_VERSION}_Linux-64bit.tar.gz && \
    rm hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

FROM gcr.io/distroless/static:nonroot
USER nonroot

COPY --from=build hugo /bin/hugo
COPY noobygames.de /site
WORKDIR /site

EXPOSE 1313

ENTRYPOINT ["hugo" "server" "-p" "1313" "--bind" "0.0.0.0"]