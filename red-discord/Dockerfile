FROM python:slim

MAINTAINER Piotr Łuczak <piotrluczak1995@gmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
	gcc \
	git \
	libav-tools \
	libffi-dev \
	libopus-dev \
	libssl-dev \
	make \
	unzip \
&& apt-get clean

RUN git clone -b develop --single-branch https://github.com/Cog-Creators/Red-DiscordBot.git /app

RUN pip install --no-cache-dir -r /app/requirements.txt

VOLUME /app/data
WORKDIR /app

CMD ["python", "./red.py", "--no-prompt"]