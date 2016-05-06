FROM python:latest

MAINTAINER Piotr Łuczak <piotrluczak1995@gmail.com>

RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y --no-install-recommends \
	ffmpeg \
	# libssl-dev \
	# libx264-dev \
	# libxext-dev \
	# libxfixes-dev \
	# make \
	# nasm \
	# openssl \
	# pkg-config \
	# zlib1g-dev \
&& apt-get clean

RUN pip install \
	beautifulsoup4 \
	git+https://github.com/Rapptz/discord.py@async \
	imgurpython \
	youtube_dl

RUN git clone -b develop --single-branch https://github.com/Twentysix26/Red-DiscordBot.git /app

VOLUME /app/data
WORKDIR /app

CMD ["python", "./red.py", "--no-prompt"]