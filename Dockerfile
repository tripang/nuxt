# Используем базовый образ Node.js
FROM node:16

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /usr/src/app

# Устанавливаем дополнительные утилиты
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/*

# Копируем package.json и package-lock.json в контейнер
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем остальные файлы проекта в контейнер
COPY . .

# Указываем порт, который будет использоваться контейнером
EXPOSE 3000

RUN chown -R node:node /usr/src/app

# Запускаем Nuxt.js приложение
CMD ["npm", "run", "dev"]
