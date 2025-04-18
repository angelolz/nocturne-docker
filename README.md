# Docker Container for hosting Nocturne
This repo contains the Docker Compose file as well as the Dockerfile for self-hosting [Nocturne](github.com/usenocturne/).

The version of Nocturne used will depend on what the latest commit is in the `main` branch for [nocturne-ui](https://github.com/usenocturne/nocturne-ui) when the latest commit of the repo was made. *I'm not sure of a better way to do this lol sorry*

# How to run
## Through Docker Compose
1. Copy the contents of `docker-compose.yaml`. 
2. Open up a terminal and navigate to where you saved the file.
3. Run `docker compose up`.

## Through Docker
1. Run `docker pull ghcr.io/angelolz/nocturne-ui:latest` in a terminal.
2. Run `docker run -d --restart unless-stopped -p 3000:3000 ghcr.io/angelolz/nocturne-ui:latest`.

You can now access the page through `http://localhost:3000`. If you want to access it on the Car Thing, read ahead.
# Access Nocturne on the Car Thing
1. If you're using a Raspberry Pi, SSH into it.
2. SSH into your Car Thing using `ssh superbird@192.168.7.2`. The password for it should be `superbird`.
3. Once inside your Car Thing, run `nano /scripts/chromium_settings.sh`
4. Edit the URL to your local address *(not `localhost`)*. It should look like this:
```
# settings for /scripts/start_chromium.sh

URL="http://192.168.xx.xx:3000/"
SCALE="1.0"
#EXTRA_CHROMIUM_ARGS="--incognito"
EXTRA_CHROMIUM_ARGS=""
EXTRA_XORG_ARGS="-nocursor"
```
5. Press `Ctrl-X` to quit, `Y` to confirm saving, and `Enter` to save to the same file.
6. Run `sudo reboot` to reboot your Car Thing.

# Acknowledgements
Huge shoutout to the Nocturne team for their amazing work on this app!
- [brandonsaldan](https://github.com/brandonsaldan)
- [68p](https://github.com/68p)
- [itsnebulalol](https://github.com/itsnebulalol)
- [BBaoVanC](https://github.com/bbaovanc)