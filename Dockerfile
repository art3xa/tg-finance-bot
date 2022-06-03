FROM python:3.8

WORKDIR /home

ENV TELEGRAM_API_TOKEN="5171387188:AAGe56DHWNFCCYa6pGYS0ktYwFU1NDzZ4jo"
ENV TELEGRAM_ACCESS_ID="724777123"

ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN pip install -U pip aiogram pytz && apt-get update && apt-get install sqlite3
COPY *.py ./
COPY createdb.sql ./

ENTRYPOINT ["python", "server.py"]

