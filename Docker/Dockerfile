FROM node:latest as build

# Setze das Arbeitsverzeichnis im Container
WORKDIR /app

# Kopiere die package.json und package-lock.json, um Abhängigkeiten zu installieren
COPY ../package*.json ./

# Installiere die Abhängigkeiten
RUN npm install

# Kopiere den Rest des Projekts in das Arbeitsverzeichnis
COPY ../. .


FROM httpd:2.4

# Kopiere die gebauten Dateien in das Apache-Verzeichnis
COPY --from=build /app/build /usr/local/apache2/htdocs/

# Exponiere den Standardport von Apache
EXPOSE 80

# Startbefehl für Apache
CMD ["httpd", "-D", "FOREGROUND"]
