FROM node:alpine3.16

ARG GITHUB_TOKEN

RUN apk add git

WORKDIR /app

COPY . .

RUN npm ci
RUN npm run build
RUN npm run semantic-release