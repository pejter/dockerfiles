FROM python:3.6-alpine

RUN apk add --no-cache --virtual .red-deps \
		ffmpeg \
		g++ \
		git \
		libffi-dev \
		libsodium-dev \
		make \
		openssl

RUN git clone -b develop --single-branch https://github.com/Cog-Creators/Red-DiscordBot.git /app

RUN pip install --no-cache-dir -r /app/requirements.txt

VOLUME ["/app/data", "/app/cogs"]
WORKDIR /app

COPY run.py /scripts/

CMD ["python", "/scripts/run.py"]
