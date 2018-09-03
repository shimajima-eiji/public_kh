FROM python:alpine
MAINTAINER nomuraya.work
RUN apk add --no-cache \
  vim \
  git \
  tzdata \
  gcc \
  g++ \
  make \
  freetype-dev \
  && pip3 install --upgrade pip setuptools \
  && pip3 install \
  pandas \
  xlrd \
  openpyxl \
  python-box \
  timeout_decorator \
  matplotlib \
  pyyaml \
  && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && apk del tzdata \
  && rm -rf /var/cache/apk/* \
  && rm -rf /root/.cache
