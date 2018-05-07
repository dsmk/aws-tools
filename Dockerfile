FROM alpine:3.7

# Configure less
ENV PAGER="less -r"

# Install required packages
RUN set -ex; \
    apk --no-cache add \
      bash \
      less \
      curl \
      jq \
      groff \
      py-pip \
      python \
      nodejs;

# Install aws-shell (which also install aws-cli)
RUN pip install --upgrade \
      pip \
      aws-shell;

# Install cwtail
RUN npm install -g cwtail;

# Install ecs-cli
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && chmod u+x /usr/local/bin/ecs-cli