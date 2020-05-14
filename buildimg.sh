#!/bin/sh
docker build -t nde:latest ./
docker rmi   -f $(docker images -f "dangling=true" -q)
