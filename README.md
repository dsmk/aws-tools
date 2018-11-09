# AWS CLI Tools

## Usage

- Open aws-shell with default aws profile:

  ```
  docker run --rm -it --volume "/Users/<user>/.aws:/root/.aws" --volume "$(pwd):/pwd" \
    -w "/pwd" carlosesilva/aws-tools-docker
  ```

- Open bash with a specific aws profile:

  ```
  docker run --rm -it --volume "/Users/<user>/.aws:/root/.aws" --volume "$(pwd):/pwd" \
    -w "/pwd" -e AWS_PROFILE=<aws_profile> carlosesilva/aws-tools-docker /bin/bash
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
