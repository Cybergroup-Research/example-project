# Example
This example repository will create and push docker image to docker hub, and release to Heroku.

# Dockerfile to Build Docker Image
    FROM cybergroupignite/runtime:v2.0.0
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
         
# Sample Git Action To Release Build to Heroku
    - name: deploy to heroku app
          uses: akhileshns/heroku-deploy@v3.2.6
          with:
            heroku_api_key: ${{secrets.HEROKU_API_KEY}}
            heroku_app_name: "ignite-example-project"
            heroku_email: "bijay.shah@cygrp.com"
            usedocker: true
            
# Sample Git Action To Release Build to Azure
    - uses: azure/webapps-deploy@v2
      with:
        app-name: 'ignite-example-project'
        publish-profile: ${{ secrets.AZURE_WEBAPP_PUBLISH_PROFILE_PRODUCTION }}
        images: 'cybergroupignite/example-project:v${{steps.buildtag.outputs.tag}}'
        
# Environment To Start Application
    IGNITE_EDITOR_API_SECRET: "<Required, Your Ignite Secret key>"
    DATABASE_URL: "<Required, Database URL>"
    START_MODE: "BUILD"
    CREDENTIAL_SECRET: "<Optional, if credential key were defined when project was created>"
    DB_SSL_OPTION: "<Optional, default is true, if your postgres server don't support SSL then use false>"
    PORT: "<Optional, default is 1881>"
    
