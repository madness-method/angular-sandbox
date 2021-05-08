# Stage 1

FROM node:10-alpine AS build-step

WORKDIR /app

RUN npm install -g @angular/cli

COPY package.json /app

RUN npm install

COPY . /app

RUN npm run build

###########

# Stage 2

FROM nginx:1.17.1-alpine

COPY --from=build-step /app/dist/mean-course /usr/share/nginx/html

EXPOSE 80

# Terminal Commands:
# docker build -t mean-course .
# docker run -p 80:80 --rm --name mean-course mean-course
