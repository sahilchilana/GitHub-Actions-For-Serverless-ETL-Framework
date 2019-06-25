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
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
RUN chmod +x /entrypoint.sh
