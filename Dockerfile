FROM node:14.17.5

ENV NODE_ENV="production"
ENV PORT="3000"
ENV ONEDEV_USERNAME=""
ENV ONEDEV_BASE_URL=""
ENV ONEDEV_PASSWORD=""
ENV GITLAB_TOKEN=""
ENV GITLAB_BASE_URL=""
ENV RSA_PRIVATE_KEY=""

# Create app directory
WORKDIR /app

# Install app dependencies
COPY package*.json babel.config.json ./
RUN npm install 
RUN npm install @babel/cli @babel/core @babel/preset-env @babel/node @babel/eslint-parser @babel/preset-react babel-loader webpack webpack-cli

# Bundle app source
COPY . /app
RUN mkdir -p /app/config && echo "{}" > /app/config/production.json

EXPOSE 3000

CMD [ "npm", "start" ]
