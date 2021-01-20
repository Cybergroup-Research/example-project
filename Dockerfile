FROM cybergroupignite/runtime:rc-dev-1.0.24-98aff1b
WORKDIR /usr/src/nodered
COPY . ./build
RUN npm run compile