# Effective Mobile DevOps Test Task

## Описание
Проект разворачивает простое веб-приложение и reverse proxy в Docker-контейнерах:

- **backend** — минимальный HTTP-сервер на Python, слушает `8080` внутри Docker-сети
- **nginx** — принимает HTTP-запросы на `80` и проксирует их в backend

Ожидаемый ответ на запрос к `/`:

Hello from Effective Mobile!

## Структура проекта

backend/
  Dockerfile
  app.py
nginx/
  nginx.conf
docker-compose.yml
.gitignore
README.md

## Используемые технологии

- Docker
- Docker Compose
- Python 3.12
- Nginx 1.27

## Как запустить

### 1. Клонировать репозиторий

git clone <repo_url>
cd effective-mobile-devops

### 2. Запустить контейнеры

docker compose up --build -d

### 3. Проверить состояние сервисов

docker compose ps

## Как проверить результат

Выполнить:

curl http://localhost

Ожидаемый результат:

Hello from Effective Mobile!

## Как работает схема

Client --> localhost:80 --> nginx --> backend:8080

1. Пользователь отправляет HTTP-запрос на `localhost:80`
2. Контейнер `nginx` принимает запрос
3. `nginx` проксирует его на сервис `backend` по имени сервиса внутри Docker-сети
4. `backend` отвечает текстом `Hello from Effective Mobile!`
5. `nginx` возвращает ответ клиенту

## Почему решение соответствует требованиям

- backend вынесен в отдельный сервис и отдельный `Dockerfile`
- backend не публикует порт наружу, доступен только внутри Docker-сети
- nginx использует официальный образ
- конфиг nginx вынесен в отдельный файл и подключён через volume
- наружу публикуется только `80:80`
- используется взаимодействие по service name (`backend`)
- у контейнеров заданы понятные имена
- добавлены healthcheck'и
- backend запускается не от `root`

## Остановка проекта

docker compose down

## Очистка вместе с образами

docker compose down --rmi local
