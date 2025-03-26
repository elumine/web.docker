# build environment
FROM node:9.6.1 AS node

FROM node AS web
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
ENV PATH /usr/src/app/node_modules/.bin:$PATH
COPY ./package.json /usr/src/app/package.json
COPY ./public /usr/src/app/public
COPY ./images /usr/src/app/images
COPY ./src /usr/src/app/src
RUN npm install --silent
RUN npm install react-scripts@1.1.1 -g --silent

FROM web AS web-start
CMD ["npm", "run", "start"]
