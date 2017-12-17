FROM debian:stretch

LABEL maintainer="seniocaires@gmail.com"

COPY . /app

RUN apt-get update && apt-get install -y --no-install-recommends git cron \
    && mv /app/cron/crontab /etc/cron.d/github-contributions-cron \
    && chmod 0644 /etc/cron.d/github-contributions-cron \
    && /usr/bin/crontab /etc/cron.d/github-contributions-cron \
    && chmod +x /app/entrypoint.sh \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["sh", "/app/entrypoint.sh"]
