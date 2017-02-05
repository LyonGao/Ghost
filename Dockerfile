FROM node:boron
WORKDIR /ghost
COPY package.json /ghost
RUN npm install --verbose && \
  npm install -g grunt-cli && \
  npm install -g knex-migrator
COPY . /ghost
ENV NODE_ENV testing
RUN cd /ghost && \
  grunt init && \
  knex-migrator init
EXPOSE 2369
CMD ["npm", "start"]