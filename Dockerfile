FROM node:latest

# Create app directory
RUN mkdir -p /src/app
WORKDIR /src/app

# to make npm test run only once non-interactively
ENV CI=true

# Bundle app source
COPY . /src/app

EXPOSE 9000

RUN cd /src/app && \
	npm install && \
    npm install -g pushstate-server

# Build and optimize react app
RUN npm start