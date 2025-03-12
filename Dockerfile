FROM node:latest AS build

WORKDIR /app

COPY package.json ../package-lock.json ./

RUN npm install

COPY . .

RUN npm run build

FROM httpd:2.4

COPY --from=build /app/build /usr/local/apache2/htdocs/

EXPOSE 80

CMD ["httpd", "-D", "FOREGROUND"]
