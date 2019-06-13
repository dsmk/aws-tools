# AWS CLI Tools

A docker image for running AWS CLI commands.

## Usage

### Bash

- Open aws-shell with default aws profile:

  ```bash
  docker run --rm -it \
    --volume "$HOME/.aws:/root/.aws" \
    --volume "$(pwd):/code" \
    bostonuniversity/aws-tools
  ```

- Open bash with a specific aws profile:

  ```bash
  docker run --rm -it \
    --volume "$HOME/.aws:/root/.aws" \
    --volume "$(pwd):/code" \
    -e AWS_PROFILE=<aws_profile> \
    bostonuniversity/aws-tools /bin/bash
  ```

- Persist the the shell history and other things across runs:

  ```bash
  docker run --rm -it \
    --volume aws-tools:/root \
    --volume "$HOME/.aws:/root/.aws" \
    --volume "$(pwd):/code" \
    bostonuniversity/aws-tools /bin/bash
  ```

### Windows CMD

In Windows, the syntax is a little bit different, for example:

```cmd
docker run --rm -it ^
--volume %cd%:/code ^
--volume C:\Some\Temporary\Directory:/root/.aws ^
--volume aws-tools:/root ^
bostonuniversity/aws-tools /bin/bash
```

### PowerShell

```powershell
docker run --rm -it --volume ${PWD}:/code --volume C:\Some\Temporary\Directory:/root/.aws --volume aws-tools:/root bostonuniversity/aws-tools /bin/bash
```

## CLI for accounts with federated access

You can use this image too access shibboleth-protected accounts (with Duo 2FA too).
To create a temporary session, just run `shib-auth` inside the container.
This session will only be available for a few hours but you can alway run that
command again to create a new one.

You can modify these environment variables to fine-tune for your own case:

Variable name        | Default value
---------------------|------------------------------
AWS_REGION           | `us-east-1`
AWS_OUTPUT_FORMAT    | `json`
AWS_LOGIN_URL        | `https://www.bu.edu/awslogin`

## Includes

### AWS

- aws-cli
- aws-shell
- awsebcli
- ecs-cli

### Other

- bash
- less
- curl
- git
- jq
- groff
- py-pip
- python
- nodejs
- npm
