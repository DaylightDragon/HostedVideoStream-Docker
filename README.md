# Hosting an own video stream (Docker and the server)

## Installation

(You can change .bat files to .sh files and remove the "@echo off" in the beginning for linux support)  

1. Create the RTMP server image with own settings:  
```sh
.\deployServer.bat
```  

2. Deploy the [Frontend image](https://github.com/DaylightDragon/HostedVideoStream-Frontend):  
```sh
.\deployScript.bat
```  

(in the Frontend's folder, not here)  

3. Create the container:  
```sh
.\createContainer.bat
```  

## Chaging the settings:

1. Modify `nginx.conf` for the RTMP server settings if needed  
   
2. Modify `compose.yml` for container settings if needed  

3. Reset the container:
```sh
.\resetCotnainer.bat
```


### Additionally

Also, by the way, I don't remember if this is required, but if you're having troubles consider creating the network in the beginning:
```sh
docker network create --subnet=172.20.0.0/16 rtmp-net
```
