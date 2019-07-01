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
ENV JQ_VERSION='1.5'

RUN wget --no-check-certificate https://raw.githubusercontent.com/stedolan/jq/master/sig/jq-release.key -O /tmp/jq-release.key && \
    wget --no-check-certificate https://raw.githubusercontent.com/stedolan/jq/master/sig/v${JQ_VERSION}/jq-linux64.asc -O /tmp/jq-linux64.asc && \
    wget --no-check-certificate https://github.com/stedolan/jq/releases/download/jq-${JQ_VERSION}/jq-linux64 -O /tmp/jq-linux64 && \
    gpg --import /tmp/jq-release.key && \
    gpg --verify /tmp/jq-linux64.asc /tmp/jq-linux64 && \
    cp /tmp/jq-linux64 /usr/bin/jq && \
    chmod +x /usr/bin/jq && \
    rm -f /tmp/jq-release.key && \
    rm -f /tmp/jq-linux64.asc && \
    rm -f /tmp/jq-linux64
RUN pip install PyYAML
RUN pip install --upgrade pip && \
    pip install setuptools aws-sam-cli
RUN git config --global url."https://$PERSONAL_ACCESS_TOKEN@github.com/".insteadOf"https://github.com/"
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
RUN chmod +x /entrypoint.sh
