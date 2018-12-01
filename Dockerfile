FROM node:8

# create build folder
RUN mkdir -p /app/public/build

# install dependencies
COPY package.json /
# link package.json with the one from the project folder
RUN npm install && \
    rm /package.json && \
    ln -s /app/package.json /package.json

# copy code
WORKDIR /app
COPY . /app

# compile and start
ENV PATH $PATH:/node_modules/.bin
CMD npm run webpack && npm run start
EXPOSE 8080/tcp
