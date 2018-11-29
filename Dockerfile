FROM python:3.7-slim

# RUN apk --update --no-cache add git openssh gcc
RUN apt-get update && \
    apt-get install git openssh gcc

RUN pip3 install --upgrade pip && \
    pip3 install pelican pelican-minify pelican-youtube markdown beautifulsoup4 typogrify gitpython

RUN git clone --recursive https://github.com/getpelican/pelican-plugins ~/pelican-plugins
RUN pip3 install -r ~/pelican-plugins/pelican-ipynb/requirements.txt

RUN git clone --recursive https://github.com/getpelican/pelican-themes ~/pelican-themes

CMD ["pelican", "-h"]
