FROM node:14.15.1

ENV NODE_ENV="production"
ENV PORT="3000"
ENV GITLAB_TOKEN=""
ENV GITLAB_BASE_URL=""
ENV RSA_PRIVATE_KEY=""

# Create app directory
RUN mkdir -p /app
WORKDIR /app

# Install app dependencies
COPY package.json /app/
RUN npm install

# Bundle app source
COPY . /app

EXPOSE 3000

CMD [ "npm", "start" ]
