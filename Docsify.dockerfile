FROM node:16.0-buster-slim

RUN apt-get update
RUN apt-get install -y fonts-ipafont-gothic fonts-ipafont-mincho

RUN apt install -y gconf-service \
                   libxext6 libxfixes3 libxi6 libxrandr2 \
                   libxrender1 libcairo2 libcups2 \
                   libdbus-1-3 libexpat1 libfontconfig1 \
                   libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 \
                   libglib2.0-0 libgtk-3-0 libnspr4 \
                   libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 \
                   libx11-6 libx11-xcb1 libxcb1 \
                   libxcomposite1 libxcursor1 libxdamage1 \
                   libxss1 libxtst6 libappindicator1 \
                   libnss3 libasound2 libatk1.0-0 \
                   libc6 ca-certificates fonts-liberation \
                   lsb-release xdg-utils

RUN npm install -g npm@7.11.2 \
                   docsify-cli@4.4.3 \
                   puppeteer@9.0.0 \
                   docsify-pdf-converter@2.0.7

RUN apt-get install -y patch

COPY render.js.patch /root/render.js.patch
RUN cd /usr/local/lib/node_modules/docsify-pdf-converter/src && \
    patch -u < /root/render.js.patch

WORKDIR /usr/local/docsify

ENTRYPOINT [ "docsify", "serve", "." ]
