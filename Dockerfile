FROM alpine:3.6

ENV PACKAGES "curl ca-certificates groff less openssl python py-pip"

RUN apk add --update $PACKAGES \
    && pip install awscli~=1.11 \
    && apk --purge -v del py-pip \
    && rm -rf /var/cache/apk/*
