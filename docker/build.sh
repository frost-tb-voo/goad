#!/bin/sh

DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)

cd ${DIR}/..
mv Dockerfile _Dockerfile_
cp docker/Dockerfile .
#sudo docker build -t novsyama/goad .
mv _Dockerfile_ Dockerfile

sudo docker run --name temp -d novsyama/goad /bin/true
sudo docker cp temp:/go/src/github.com/goadapp/goad/build ${DIR}/
sudo docker stop temp
sudo docker rm temp

