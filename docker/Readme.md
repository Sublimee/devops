# Commands

delete all images
> docker rmi -f $(docker images -a -q)

# Debian-like

Add Insecure Registry 
> https://stackoverflow.com/questions/42211380/add-insecure-registry-to-docker
