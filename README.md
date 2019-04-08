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

### Powershell

```powershell
docker run --rm -it --volume ${PWD}:/code --volume C:\Some\Temporary\Directory:/root/.aws --volume aws-tools:/root bostonuniversity/aws-tools /bin/bash
```

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
