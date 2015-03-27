# Docker very secured Nginx with secure SSL
_maintained by MarvAmBass_

[FAQ - All you need to know about the marvambass Containers](https://marvin.im/docker-faq-all-you-need-to-know-about-the-marvambass-containers/)

## What is it

This Dockerfile (available as ___marvambass/nginx-ssl-secure___) gives you a ready to use secured production nginx server, with perfectly configured SSL. You should get a A+ Rating at the Qualys SSL Test.

View in Docker Registry [marvambass/nginx-ssl-secure](https://registry.hub.docker.com/u/marvambass/nginx-ssl-secure/)

View in GitHub [MarvAmBass/docker-nginx-ssl-secure](https://github.com/MarvAmBass/docker-nginx-ssl-secure)

## Environment variables and defaults

* __DH\_SIZE__
 * default: 2048 (which takes a long time to create), for demo or unsecure applications you can use smaller values like 512

## Running marvambass/nginx-ssl-secure Container

This Dockerfile is not really made for direct usage. It should be used as base-image for your nginx project. But you can run it anyways.

You should overwrite the _/etc/nginx/external/_ with a folder, containing your nginx __\*.conf__ files, certs and a __dh.pem__.   
_If you forget the dh.pem file, it will be created at the first start - but this can/will take a long time!_

    docker run -d \
    -p 80:80 -p 443:443 \
    -e 'DH_SIZE=512' \
    -v $EXT_DIR:/etc/nginx/external/ \
    marvambass/nginx-ssl-secure

## Based on

This Dockerfile bases on the [/\_/nginx/](https://registry.hub.docker.com/_/nginx/) Official Image.

## Cheat Sheet

### Creating the dh4096.pem with openssl

To create a Diffie-Hellman cert, you can use the following command

    openssl dhparam -out dh4096.pem 4096

### Creating a high secure SSL CSR with openssl

This cert might be incompatible with Windows 2000, XP and older IE Versions

    openssl req -nodes -new -newkey rsa:4096 -out csr.pem -sha256

### Creating a self-signed ssl cert

Please note, that the Common Name (CN) is important and should be the FQDN to the secured server:

    openssl req -x509 -newkey rsa:4086 \
    -keyout key.pem -out cert.pem \
    -days 3650 -nodes -sha256
