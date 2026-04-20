FROM python:3.12-alpine

WORKDIR /app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY app.py /app/app.py

RUN chown -R appuser:appgroup /app

USER appuser

EXPOSE 8080

CMD ["python", "/app/app.py"]
