FROM node:alpine3.16

# Inject the environment variable with our github personal access token
ARG GITHUB_TOKEN

ENV CI true

# Add git to our alpine image so semantic-release can execute git push
RUN apk add git

WORKDIR /app

COPY . .

RUN npm ci
RUN npm run build
RUN npm run semantic-release