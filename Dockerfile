FROM debian:stretch

LABEL maintainer="seniocaires@gmail.com"

ENV GIT_CONFIG_USER_NAME="Senio Caires"
ENV GIT_CONFIG_USER_EMAIL="seniocaires@gmail.com"
ENV GITHUB_RATING_REPOSITORY_NAME="rating"
ENV GITHUB_USER_NAME="seniocaires"
ENV GITHUB_PASSWORD=""

COPY . /app

RUN apt-get update && apt-get install -y git \
    && chmod +x /app/entrypoint.sh

ENTRYPOINT ["sh", "/app/entrypoint.sh"]
