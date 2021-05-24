FROM alpine:3.11

# aws-cfn-bootstrap scripts require python 2 still :-(
# See https://github.com/aws-cloudformation/aws-cloudformation-coverage-roadmap/issues/151
RUN apk --no-cache --update add curl ca-certificates groff less openssl python py-pip && \
  pip install --no-cache-dir --upgrade pip && \
  pip install --no-cache-dir awscli~=1.18 https://s3.amazonaws.com/cloudformation-examples/aws-cfn-bootstrap-1.4-31.tar.gz
