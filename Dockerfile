FROM gui-apps-base:18.04
MAINTAINER Gabriel Ionescu <gabi.ionescu+dockerthings@protonmail.com>

RUN echo "\n > INSTALL DEPENDENCIES\n" \
 && apt-get update \
 && apt-get install -y --no-install-recommends \
        software-properties-common \
 \
 && echo "\n > INSTALL DBEAVER\n" \
 && add-apt-repository ppa:serge-rider/dbeaver-ce \
 && apt-get update \
 && apt-get install -y \
        dbeaver-ce \
 \
 && echo "\n > CLEANUP\n" \
 && apt-get remove -y \
        software-properties-common \
 && apt-get clean -y \
 && apt-get autoclean -y \
 && apt-get autoremove -y \
 && rm -f /var/cache/apt/archives/*.deb

# SET USER
USER $DOCKER_USERNAME

# ENTRYPOINT
ENTRYPOINT /usr/bin/dbeaver
