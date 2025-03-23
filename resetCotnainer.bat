@echo off
docker-compose -p nginx-rtmp-server down --volumes
docker-compose -p nginx-rtmp-server up -d