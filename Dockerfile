FROM python:3.11-slim

WORKDIR /app

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Копируем requirements и устанавливаем Python-зависимости
COPY ./requirements.txt /app
RUN pip install --no-cache-dir -r requirements.txt

# Копируем весь код
COPY . /app

# Разрешаем запуск start.sh
RUN chmod +x start.sh

# Открываем порты FastAPI и Streamlit
EXPOSE 8000
EXPOSE 8501

# Запускаем оба сервиса
CMD ["./start.sh"]