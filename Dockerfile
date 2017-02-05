FROM node:argon
WORKDIR /ghost
ADD . /ghost
ENV NODE_ENV testing
RUN npm install -g grunt-cli && \
  npm install -g knex-migrator && \
EXPOSE 2369
CMD ["npm", "start"]