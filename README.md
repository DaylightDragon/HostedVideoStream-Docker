# Hosting an own video stream (Docker and the server)

## Description
This is a project for those who want to just stream their screen to their friends with their usual OBS settings straight from OBS itself. This also has a password/token protection.  
You need to specify tn in `nginx.conf` at the line:
```
if ($http_authorization != "YOUR_SECRET_TOKEN") {
```

Where you can put absolutely any character combination as a token. It serves as some basic protection from random people, so you can be sure the stream isn't being watched by random web scanner bots (idk) or someone who just knows your IP and the port. Additionally you can change the port in the `compose.yml` file.

### Setting up your OBS:
First, consider creating a new OBS profile and/or the scenes collection to split all settings from your usual ones. (Those are found on the top bar)  
Then you simply need to go to your settings, the broadcasting tab, select a Custom service and specify these parameters:  
> **Server**: `rtmp://127.0.0.1/live` (if you're streaming from the same device that has the Docker container)  
> **Key**: `test` (unless you want to change it in the project files)  

### Stream creation permissions
There are a few lines in the `nginx.conf` file:
In the `rtmp.server` section:

```nginx configuration
allow publish 172.20.0.1;
deny publish all;
```

This allows to start a stream only from this address. It can differ on your device (though probably not), so either check it **or just delete these two lines** since the STMP server is **already hidden from outside** by the design.

### Ports to open on your router

You only need to open the Frontend's port, which is 5220 by default

## Installation

(You can change .bat files to .sh files and remove the "@echo off" in the beginning for linux support)  

0. I don't remember if this is required, but maybe create a docker network in the beginning:
```sh
docker network create --subnet=172.20.0.0/16 rtmp-net
```

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

## Important note
There is unique info in both repositories, so read through both of them to not have questions.
