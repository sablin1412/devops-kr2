FROM python:3.12-slim

WORKDIR /app

RUN groupadd -r app && useradd -r -g app -d /app -s /sbin/nologin app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
RUN chown -R app:app /app

USER app

EXPOSE 8001

CMD ["gunicorn", "--bind", "0.0.0.0:8001", "app:app"]
