FROM node:15.11.0

WORKDIR /usr/bin/smart-brain-api
COPY ./ ./
RUN npm install

# CMD ["npm", "start"]