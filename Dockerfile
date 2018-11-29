FROM python:3.7-slim

# RUN apk --update --no-cache add git openssh gcc
RUN apt-get update && \
    apt-get install -y git

RUN pip3 install --upgrade pip && \
    pip3 install pelican pelican-minify pelican-youtube markdown beautifulsoup4 typogrify gitpython

RUN git clone --recursive https://github.com/getpelican/pelican-plugins ~/pelican-plugins
RUN cd ~/pelican-plugins && \
    git submodule update --init --recursive
RUN cd
RUN pip3 install -r ~/pelican-plugins/pelican-ipynb/requirements.txt

RUN git clone --recursive https://github.com/getpelican/pelican-themes ~/pelican-themes

RUN cd ~/pelican-plugins && \
    git submodule update --remote --merge
RUN cd

CMD ["pelican", "-h"]
