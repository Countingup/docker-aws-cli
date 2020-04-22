# awscli

[![Docker Automated build](https://img.shields.io/docker/build/countingup/awscli.svg)](https://hub.docker.com/r/countingup/awscli/builds/)

Utility container built on Alpine 3.11 for interaction with AWS services.

Includes recent AWS client tools (awscli version~=1.18), to interact with the AWS platform via
command line, (AWS CloudFormation helper scripts)[https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-helper-scripts-reference.html], and curl with SSL support (so openssl plus
 ca-certificates) to allow scripting HTTP/HTTPS calls (e.g. to query metadata).

## Build locally

```
$ cd docker-awscli
$ docker build -t countingup/awscli .
```

## Run (will pull from dockerhub)

```
$ docker run -it countingup/awscli aws help
$ docker run -it countingup/awscli curl https://www.google.com
```
Shell scripts can be used to make these commands easily available from the host machine e.g.
```
$ echo 'docker run --rm countingup/awscli curl "$@"' > /usr/bin/curl && chmod +x /usr/bin/curl
$ echo 'docker run --rm countingup/awscli aws "$@"' > /usr/bin/aws && chmod +x /usr/bin/aws
```
S3 file operations may require bind mounting a host path as a volume in the container e.g.
```
$ echo 'docker run --rm -v /tmp:/tmp countingup/awscli aws "$@"' > /usr/bin/aws && chmod +x /usr/bin/aws
```
