# Install python
FROM python:3.10-alpine

# update apk repo
RUN echo "http://dl-4.alpinelinux.org/alpine/v3.14/main" >> /etc/apk/repositories && \
    echo "http://dl-4.alpinelinux.org/alpine/v3.14/community" >> /etc/apk/repositories

# install microsoft edge
RUN apk update
RUN apt-get install microsoft-edge-stable

RUN wget -O /tmp/edgedriver_linux64.zip https://msedgedriver.azureedge.net/109.0.1518.52/edgedriver_linux64.zip \
    && unzip /tmp/edgedriver_linux64.zip msedgedriver -d /usr/bin/ \
    && rm /tmp/edgedriver_linux64.zip \
    && chmod ugo+rx /usr/bin/msedgedriver

# upgrade pip
RUN pip install --upgrade pip


RUN chmod +x entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
