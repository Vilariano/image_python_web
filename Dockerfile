# # Install python
# FROM python:3.10-alpine

# # install google chrome
# # RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
# # RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
# RUN apt-get -y update
# RUN apt-get install google-chrome-stable

FROM python:3.10-alpine

# update apk repo
RUN echo "http://dl-4.alpinelinux.org/alpine/v3.14/main" >> /etc/apk/repositories && \
    echo "http://dl-4.alpinelinux.org/alpine/v3.14/community" >> /etc/apk/repositories

# # set display port to avoid crash
# ENV DISPLAY=:99
ENV CHROME_DRIVER_VERSION 112.0.5615.49

RUN apk update
RUN apk add chromium chromium-chromedriver

# # install chromedriver
RUN apk add -yqq unzip
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip \
    && unzip -o /tmp/chromedriver.zip chromedriver -d /usr/bin/ \
    && rm /tmp/chromedriver.zip \
    && chmod ugo+rx /usr/bin/chromedriver

# upgrade pip
RUN pip install --upgrade pip

# install selenium
RUN pip install selenium

RUN pip install --upgrade pip
RUN pip install nose
RUN pip install behave
RUN pip install selenium
RUN pip install jsonschema
RUN pip install behave-html-formatter
RUN pip install allure-behave
RUN pip install Faker

ADD docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
