FROM node:16.19.0-buster-slim as build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM nginx
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80