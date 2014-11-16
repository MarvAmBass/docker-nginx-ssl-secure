# Docker very secured Nginx with secure SSL
_maintained by MarvAmBass_

## What is it

This Dockerfile (available as ___marvambass/nginx-ssl-secure___) gives you a ready to use secured production nginx server, with perfectly configured SSL. You should get a A+ Rating at the Qualys SSL Test.

View in Docker Registry [marvambass/nginx-ssl-secure](https://registry.hub.docker.com/u/marvambass/nginx-ssl-secure/)

View in GitHub [MarvAmBass/docker-nginx-ssl-secure](https://github.com/MarvAmBass/docker-nginx-ssl-secure)

## Running marvambass/nginx-ssl-secure Container

This Dockerfile is not really made for direct usage. It should be used as base-image for your nginx project. But you can run it anyways.

You should overwrite the _/etc/nginx/external/_ with a folder, containing your nginx __\*.conf__ files, certs and a __dh4096.pem__.   
_If you forget the dh4096.pem file, it will be created at the first start - but this can/will take a long time!_

    docker run -d \
    -p 80:80 -p 443:443 \
    -v $EXT_DIR:/etc/nginx/external/ \
    marvambass/nginx-ssl-secure

## Based on

This Dockerfile bases on the [/\_/nginx/](https://registry.hub.docker.com/_/nginx/) Official Image.
