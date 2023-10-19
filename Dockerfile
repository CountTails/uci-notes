
FROM alpine as clone

ENV GIT_REPO=https://github.com/nathancmendoza/school-notes.git 
ENV SRV_DIR=/srv/school-notes

RUN apk update && apk add --no-cache git
RUN git clone ${GIT_REPO} ${SRV_DIR}

FROM rust:1.73 as builder

ENV SRV_DIR=/srv/school-notes

COPY --from=clone ${SRV_DIR} ${SRV_DIR}
RUN cargo install mdbook mdbook-katex

WORKDIR ${SRV_DIR}
RUN mdbook build

FROM nginx:alpine

ENV SRV_DIR=/srv/school-notes
ENV APP_DIR=/app/book

COPY --from=builder ${SRV_DIR}/book ${APP_DIR}
COPY ./nginx.conf /etc/nginx/nginx.conf

