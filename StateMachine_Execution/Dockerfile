FROM python:2.7-stretch

LABEL version="0.0.1"
LABEL repository="https://github.com/innovaccer/GitHub-Actions-For-Serverless-ETL-Framework"
LABEL homepage="https://github.com/innovaccer/GitHub-Actions-For-Serverless-ETL-Framework"
LABEL maintainer="sahil chilana <sahilchilana@gmail.com>"
LABEL com.github.actions.name="Execute State Machine"
LABEL com.github.actions.description="Action that executes state machine and describes its execution "
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="blue"
RUN apt-get install python
RUN pip install --upgrade pip && \
    pip install setuptools aws-sam-cli
RUN pip install awscli --upgrade
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
RUN chmod +x /entrypoint.sh
