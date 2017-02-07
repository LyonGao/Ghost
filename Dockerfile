FROM ubuntu:latest

RUN apt-get update && apt-get -y install curl && \
  curl -sL https://deb.nodesource.com/setup_6.x | -E bash - && \
  apt-get install -y nodejs && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get install -y yarn

RUN mkdir -p /ghost
WORKDIR /ghost
COPY package.json /ghost
RUN yarn install && \
  yarn global add grunt-cli && \
  yarn global add knex-migrator
COPY . /ghost
ENV NODE_ENV testing
RUN grunt init && \
  knex-migrator init
EXPOSE 2369
CMD ["npm", "start"]