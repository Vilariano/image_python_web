# Install python
FROM python:3.8

# MAINTAINER name and e-mail address
MAINTAINER Agnaldo Vilariano <aejvilariano128@gmail.com>

RUN pip install bzt

ADD docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]