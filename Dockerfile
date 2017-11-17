FROM debian:stretch

LABEL maintainer="seniocaires@gmail.com"

ENV GIT_USER_NAME="Senio Caires"
ENV GIT_USER_EMAIL="seniocaires@gmail.com"
ENV GIT_RATING_REPOSITORIO="https://github.com/seniocaires/rating.git"

COPY . /app

RUN apt-get update && apt-get install -y git \
    && chmod +x /app/entrypoint.sh

ENTRYPOINT ["sh", "/app/entrypoint.sh"]
