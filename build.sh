#!/bin/sh

cd /opt/dsd
ls -la
#apk update && apk upgrade
apk add -U --no-cache git nodejs-npm wget go-tools libc-dev
wget --quiet http://getcarina.github.io/jupyterhub-tutorial/slides/img/docker-swarm.png -O /opt/dsd/src/docker.png
npm install --only=production
npm run-script build
rm -r /opt/dsd/node_modules

go get "github.com/docker/docker/api/types"
go get "github.com/docker/docker/client"
go get "github.com/gorilla/mux"
go get "golang.org/x/net/context"
go build dockerswarmdashboard.go

rm -r /root/go /root/.npm

apk del --purge git nodejs-npm wget go-tools libc-dev