#!/bin/bash
pwd
ls
rm -rf *
git clone https://github.com/sudalaimanis/Dockerfiles.git
pwd
ls
path=$(pwd)
cp ./Dockerfiles/* $path
sudo docker images
sudo docker build . -t sudalaimmanis/newapp
sudo docker images
sudo docker push sudalaimmanis/newapp
