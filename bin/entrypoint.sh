#!/bin/sh

echo "If you need to authenticate for a regular AWS account: aws configure"
echo ""
echo "If you need to authenticate using Shibboleth: shib-auth"
echo ""
echo "If you want to add an ssh key for authentication: ssh-add keyfile"
echo ""
echo "If you want to enter the aws command line: aws-shell"
echo ""
echo "Also, git, terraform, and ssh are available"
echo ""

if [ ! -f /root/.aws/credentials ]; then
    mkdir -p /root/.aws
    touch /root/.aws/credentials
fi

exec ssh-agent "$@"
