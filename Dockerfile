FROM node:argon
WORKDIR /ghost
ADD . /ghost
ENV NODE_ENV testing
RUN npm install && \
  npm install -g grunt-cli && \
  npm install -g knex-migrator && \
  grunt init && \
  knex-migrator init
EXPOSE 2369
CMD ["npm", "start"]