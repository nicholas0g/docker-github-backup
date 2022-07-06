FROM python

WORKDIR /app

COPY . .

RUN pip install github-backup

CMD ["./run.sh"]