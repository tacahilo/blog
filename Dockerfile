FROM alpine:3.7

RUN apk add --no-cache -q libstdc++ perl openssl \
      && apk add --no-cache -q -t .build-deps git build-base cmake linux-headers zlib-dev ruby ruby-rake ruby-dev bison \
      && git clone --depth 1 https://github.com/h2o/h2o \
      && cd /h2o \
      && cmake -DWITH_MRUBY=ON -DWITH_BUNDLED_SSL=ON . \
      && make install \
      && apk del -q .build-deps \
      && rm -rf /h2o

COPY h2o.conf /etc/h2o.conf
EXPOSE 80 443
CMD "h2o"
