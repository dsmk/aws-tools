FROM alpine:3.8

# Configure less
ENV PAGER="less -r"
ENV AWS_REGION="us-east-1"
ENV AWS_OUTPUT_FORMAT="json"
ENV AWS_LOGIN_URL="https://www.bu.edu/awslogin"
ENV TERRAFORM_VERSION "0.12.4"

# Install required packages
RUN set -ex; \
    apk --no-cache add \
      bash \
      less \
      curl \
      zip \
      git \
      jq \
      groff \
      py-pip \
      python3 \
      chromium \
      udev \
      ttf-freefont \
      nodejs \
      npm; \
    npm install -g npm;

# Install aws-shell (which also installs aws-cli) and some dependencies
RUN pip3 install --upgrade \
      pip \
      aws-shell \
      awsebcli \
      boto==2.49.0 \
      pyppeteer==0.0.25

# Hand-patch the issue with Network Timeouts, see https://github.com/miyakogi/pyppeteer/pull/160
RUN sed -i 's/self._url, max_size=None, loop=self._loop)/self._url, max_size=None, loop=self._loop, ping_interval=None, ping_timeout=None)/' /usr/lib/python3.6/site-packages/pyppeteer/connection.py

# Install ecs-cli
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && chmod u+x /usr/local/bin/ecs-cli

# Install terraform
RUN curl -o terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip -d /usr/bin terraform.zip \
    && rm terraform.zip \
    && echo "complete -C '/usr/bin/terraform' terraform" >>~/.bashrc

# Add aws cli command completion
RUN echo "complete -C '/usr/bin/aws_completer' aws" >> ~/.bashrc

RUN mkdir /code
WORKDIR /code

RUN mkdir /aws-auth
ADD aws-auth/ /aws-auth/
ADD bin/ /usr/local/bin/

ENTRYPOINT [ "entrypoint.sh" ]
CMD [ "/bin/bash" ]
#CMD [ "aws-shell" ]