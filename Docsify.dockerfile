FROM node:16.0-buster-slim

RUN npm install -g npm@7.11.2 && \
    npm install -g docsify-cli@4.4.3

WORKDIR /usr/local/docsify

ENTRYPOINT [ "docsify", "serve", "." ]