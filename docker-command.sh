#!/bin/bash

# write env variables to config.json
jsonenv ${ENV_PREFIX} /usr/share/nginx/html/${CONFIG_NAME}

# start nginx
# s. https://goo.gl/wiDNWV
nginx -g "daemon off;"
