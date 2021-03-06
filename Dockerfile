# syntax=docker/dockerfile:1

FROM node:16
ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "yarn.lock*", "./"]

RUN npm install --production

COPY . .

CMD [ "node", "server.js" ]