FROM python:2.7-stretch

LABEL version="0.0.1"
LABEL repository="https://github.com/sahilchilana/Githubactions"
LABEL homepage="https://github.com/sahilchilana/Githubactions"
LABEL maintainer="sahil chilana <sahilchilana@gmail.com>"
LABEL com.github.actions.name="Install python2.7"
LABEL com.github.actions.description="Action that enables building and testing of Python 2.7 packages "
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="blue"
RUN apt-get install python
RUN pip install requests
RUN pip install PyYAML
RUN apt-get update && \
  apt-get install -y --no-install-recommends curl groff jq && \
  apt-get -y clean && apt-get -y autoclean && apt-get -y autoremove && \
  curl -fsSLO https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.3.0/heptio-authenticator-aws_0.3.0_linux_amd64 && \
  mv heptio-authenticator-aws_0.3.0_linux_amd64 /usr/local/bin/aws-iam-authenticator && \
  chmod +x /usr/local/bin/aws-iam-authenticator && \
  curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz && \
  tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 \
                 -C /usr/local/bin docker/docker && \
  rm docker-${DOCKERVERSION}.tgz && \
  rm -rf /var/lib/apt/lists/* && \
  pip install --upgrade pip && \
  pip install setuptools awscli aws-sam-cli
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
RUN chmod +x /entrypoint.sh
