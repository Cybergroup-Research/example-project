FROM cybergroupignite/runtime:v2.0.0
WORKDIR /usr/src/nodered
COPY . ./build
RUN npm run compile
