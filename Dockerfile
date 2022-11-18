FROM keymetrics/pm2:latest-alpine

# Bundle APP files
COPY src src/
COPY src/package.json .
COPY src/pm2.json .

# Install app dependencies
ENV NPM_CONFIG_LOGLEVEL warn
RUN npm install --production

# Show current folder structure in logs
RUN ls -al -R

CMD [ "pm2-runtime", "start", "pm2.json" ]