# Dockerfile
FROM FROM node:18

# Create app directory
WORKDIR /usr/src/app

RUN apk upgrade --no-cache -U && \
  apk add --no-cache curl gnupg libstdc++

RUN apk upgrade --no-cache -U && \
  apk add --no-cache curl make gcc g++ linux-headers binutils-gold gnupg libstdc++

COPY . .
#COPY package*.json ./
#COPY ./src ./
#COPY ./public ./

RUN npm install

EXPOSE 8080

RUN npm run start

