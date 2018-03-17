FROM alpine:3.7

ENV PAGER="less -r"

RUN set -ex; \
    apk --no-cache add \
      bash \
      less \
      curl \
      jq \
      groff \
      py-pip \
      python;

RUN pip install --upgrade \
      pip \
      aws-shell;
