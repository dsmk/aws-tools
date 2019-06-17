#!/bin/sh

echo "If you need to authenticate for a regular AWS account: aws configure"
echo ""
echo "If you need to authenticate using Shibboleth: shib-auth"

if [ ! -f /root/.aws/credentials ]; then
    mkdir -p /root/.aws
    touch /root/.aws/credentials
fi

exec "$@"
