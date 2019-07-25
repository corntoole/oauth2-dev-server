FROM node:8-alpine

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY package.json /usr/src/app
COPY yarn.lock /usr/src/app
RUN yarn

COPY . .

RUN addgroup -g 512 -S zing && adduser -S -u 512 zing -G zing
USER 512

ENTRYPOINT ["npx", "oauth2-mock-server"]

