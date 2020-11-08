FROM node:alpine  as teamblack
WORKDIR /var/app
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build


# second block
FROM nginx
EXPOSE 80
COPY --from=teamblack /var/app/build /usr/shar/nginx/html




