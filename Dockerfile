FROM cybergroupignite/runtime:v2.0.0
ARG BUILD_VERSION
WORKDIR /usr/src/nodered
RUN echo BUILD_VERSION=${BUILD_VERSION} >> .env
COPY . ./build
RUN npm run compile
