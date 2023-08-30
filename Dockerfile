# Dockerfile
FROM node:13.12.0-alpine

# Create app directory
WORKDIR /usr/src/app
ENV PATH /app/node_modules/.bin:$PATH

RUN apk upgrade --no-cache -U && \
  apk add --no-cache curl gnupg libstdc++

RUN apk upgrade --no-cache -U && \
  apk add --no-cache curl make gcc g++ linux-headers binutils-gold gnupg libstdc++

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent
COPY . .
#COPY package*.json ./
#COPY ./src ./
#COPY ./public ./

RUN npm install

EXPOSE 8080

RUN npm run start



