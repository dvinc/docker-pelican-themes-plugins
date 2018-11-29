FROM python:3.7-alpine

RUN apk --update --no-cache add git openssh

RUN pip3 install --upgrade pip && \
    pip3 install pelican pelican-minify pelican-youtube markdown beautifulsoup4 typogrify

RUN git clone --recursive https://github.com/getpelican/pelican-themes ~/pelican-themes
RUN git clone --recursive https://github.com/getpelican/pelican-plugins ~/pelican-plugins

RUN pip3 install -r ~/pelican-plugins/pelican-ipynb/requirements.txt
RUN pip3 install gitpython

CMD ["pelican", "-h"]
