#!/bin/bash

cat <<EOF
Welcome to the marvambass/nginx-ssl-secure container

IMPORTANT:
  IF you use SSL inside your personal NGINX-config,
  you should add the Strict-Transport-Security header like:

    add_header Strict-Transport-Security "max-age=31536000; includeSubdomains";

  to your config.
  After this you should gain a A+ Grade on the Qualys SSL Test

EOF

if [ -z ${DH_SIZE+x} ]
then
  >&2 echo ">> no \$DH_SIZE specified using default" 
  DH_SIZE="4096"
fi


DH="/etc/nginx/external/dh.pem"

if [ ! -e "$DH4096" ]
then
  echo ">> seems like the first start of nginx"
  echo ">> doing some preparations..."
  echo ""

  echo "generating $DH with size: $DH_SIZE"
  openssl dhparam -out "$DH" $DH_SIZE
fi

echo ">> copy /etc/nginx/external/*.conf files to /etc/nginx/conf.d/"
cp /etc/nginx/external/*.conf /etc/nginx/conf.d/ 2> /dev/null > /dev/null

# exec CMD
echo ">> exec docker CMD"
echo "$@"
"$@"
