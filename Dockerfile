FROM zalari/nginx-html5

LABEL "org.opencontainers.image.authors"="info@zalari.de"
LABEL "org.opencontainers.image.version"="1.0"

ENV ENV_PREFIX=ZALARI
ENV CONFIG_NAME=config.json

# update and install jq
RUN apt-get update && apt-get -y install jq

# make jsonenv globally available
COPY init/jsonenv.sh /bin/jsonenv
RUN chmod 755 /bin/jsonenv

# copy start script and set permissions
COPY ./docker-command.sh /etc/init.d/
RUN chmod 744 /etc/init.d/docker-command.sh

# run command on start
CMD ["/bin/bash", "/etc/init.d/docker-command.sh"]
