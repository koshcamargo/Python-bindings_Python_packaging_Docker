FROM python:3.8-slim

# Устанавливаем необходимые зависимости
RUN apt-get update && \
    apt-get install -y cmake g++

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем файлы проекта
COPY . .

RUN pip install numpy
# Сборка пакета
RUN python3 -m pip install build
RUN python3 -m build
RUN pip install dist/*.whl

# Запуск тестов
RUN python3 test_rowmean.py


