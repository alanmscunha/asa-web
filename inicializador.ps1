#!/bin/bash

## CRIANDO AS IMAGENS NO DOCKER (IMPORTATE LEMBRAR QUE O DOCKER  PRECISA ESTÁ ABERTO EM SUA MAQUINA.).
docker build -t c01 -f Dockerfile.c01 .

docker build -t c02 -f Dockerfile.c02 .

docker build -t c03 -f Dockerfile.c03 .

docker build -t proxy -f Dockerfile.proxy .


## INICIALIZANDO AS IMAGENS CRIADAS EM UMA REDE ESPECIFICA PARA OS CONTAINERS POREM SE COMUNICAR ENTRE SI.

docker network create -d bridge asa-net

docker run -d --net=asa-net --name c01 c01

docker run -d --net=asa-net --name c02 c02

docker run -d --net=asa-net --name c03 c03

docker run -dp 8090:80 --net=asa-net --name proxy proxy