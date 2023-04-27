FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
  ffmpeg \
  imagemagick \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/
  

COPY package.json .

RUN npm install && npm install pm2 -g 

ENV PM2_PUBLIC_KEY pye0hu67proivzg
ENV PM2_SECRET_KEY p108bar5fnx5rmp

COPY . .

EXPOSE 5000

CMD ["npm", "start", "pm2-runtime", "app.js"]
