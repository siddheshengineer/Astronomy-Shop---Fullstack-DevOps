FROM python:3.12-slim-bookworm AS base
WORKDIR /usr/src/app/
COPY requirements.txt ./

RUN pip install --upgrade pip && pip install -r requirements.txt
COPY . .
ENTRYPOINT [ "python", "recommendation_server.py"]