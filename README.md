# Example
This example repository will create and push docker image to docker hub, and release to Heroku.

# Dockerfile to Build Docker Image
    FROM cybergroupignite/runtime:rc-dev-1.0.24-98aff1b
    WORKDIR /usr/src/nodered
    COPY . ./build
    RUN npm run compile

# Git Action To Create Build & Push to Docker Hub
    - name: create and push docker build
       uses: docker/build-push-action@v1
       with:
         username: ${{ secrets.DOCKER_USERNAME }}
         password: ${{ secrets.DOCKER_PASSWORD }}
         repository: cybergroupignite/example-project
         tags: v${{steps.buildtag.outputs.tag}}
         
 
# Git Action To Release Build to Heroku
    - name: deploy to heroku app
          uses: akhileshns/heroku-deploy@v3.2.6
          with:
            heroku_api_key: ${{secrets.HEROKU_API_KEY}}
            heroku_app_name: "ignite-example-project"
            heroku_email: "bijay.shah@cygrp.com"
            usedocker: true
           
# Environment To Start Application
    IGNITE_EDITOR_API_SECRET: "<Your Ignite Secret key>"
    DATABASE_URL: "<Database URL>"
    START_MODE: "BUILD"
    CREDENTIAL_SECRET: "<Optional, if credential key were defined when project was created>"
    DB_SSL_OPTION: "<Optional, default is true, if your postgres server don't support SSL then use false>"
    
