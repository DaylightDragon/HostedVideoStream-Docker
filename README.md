# Hosting an own video stream (Docker and the server)

## Description
This is a project for those who want to just stream their screen to their friends with their usual OBS settings straight from OBS itself. This also has a password/token protection.  
You need to specify tn in `nginx.conf` at the line:
```
if ($http_authorization != "YOUR_SECRET_TOKEN") {
```

Where you can put absolutely any character combination as a token. It serves as some basic protection from random people, so you can be sure the stream isn't being watched by random web scanner bots (idk) or someone who just knows your IP and the port. Additionally you can change the port in the `compose.yml` file.

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
