# Commands

delete all images
> docker rmi -f $(docker images -a -q)

delete all containers
> docker rm $(docker ps -aq)

# Guides

add insecure registry (Debian-like)
> https://stackoverflow.com/questions/42211380/add-insecure-registry-to-docker

define dns
> https://stackoverflow.com/a/49627674
