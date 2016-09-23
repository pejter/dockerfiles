FROM python:latest

MAINTAINER Piotr Łuczak <piotrluczak1995@gmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
	git \
	libav-tools \
	libffi-dev \
	libopus-dev \
	libssl-dev \
	unzip \
&& apt-get clean

RUN pip install \
	git+https://github.com/Rapptz/discord.py@async \
	imgurpython \
	youtube_dl

RUN git clone -b develop --single-branch https://github.com/Twentysix26/Red-DiscordBot.git /app

VOLUME /app/data
WORKDIR /app

CMD ["python", "./red.py", "--no-prompt"]