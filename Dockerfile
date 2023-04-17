FROM node:16.19-alpine as intermediate

WORKDIR /usr/src/app
RUN apk add --no-cache git tini -y

ARG GIT_SSH_KEY

RUN mkdir /root/.ssh/
RUN echo "${GIT_SSH_KEY}" > /root/.ssh/id_rsa

# make sure your domain is accepted
RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com

RUN git clone git@github.com:saldyy/s3-cloudfront.git

FROM node:16.19-alpine

WORKDIR /usr/src/app

RUN ls
