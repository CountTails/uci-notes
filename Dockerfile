FROM nginx:alpine

COPY book/ /app/book

COPY ./nginx.conf /etc/nginx/nginx.conf
