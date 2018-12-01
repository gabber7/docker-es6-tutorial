FROM node:8

RUN mkdir -p /app/public/build

COPY package.json /
RUN npm install && rm /package.json && ln -s /app/package.json /package.json

WORKDIR /app
COPY . /app

ENV PATH $PATH:/node_modules/.bin
CMD npm run babel && npm run start
EXPOSE 8080/tcp
