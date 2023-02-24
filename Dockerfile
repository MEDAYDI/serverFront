FROM node:latest as build-step
WORKDIR /app
COPY package.json ./ 
RUN npm --force install 
COPY . .
RUN npm run build 

FROM nginx:alpine as prdo-step
COPY --from=build-step /app/dist/SERVERAPP /usr/share/nginx/html
EXPOSE 80
