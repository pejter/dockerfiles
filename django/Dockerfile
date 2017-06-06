FROM python:latest

ENV WORKERS=2
ENV DJANGO_PROJECT_NAME=myproject

RUN apt-get update && apt-get install --no-install-recommends -y \
		gcc \
		gettext \
		mysql-client libmysqlclient-dev \
		postgresql-client libpq-dev \
		sqlite3 \
	&& apt-get clean

VOLUME /app
WORKDIR /app

ONBUILD COPY requirements.txt ./
ONBUILD RUN pip install gunicorn && pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

CMD gunicorn $DJANGO_PROJECT_NAME.wsgi:application --name $HOSTNAME --workers $WORKERS --forwarded-allow-ips="*" --bind 0.0.0.0:8000