ARG VERSION=latest
from node:${VERSION}
label appversion="1.0"
label author="pritesh.kumar2@gmail.com"
label usesdb="mysql:8.0"
ENV npmuse=1
ENV node_env="testing"
ARG username="jenkins"
ARG appdir="nodeapps"
run adduser -ms /bin/bash $username
run mkdir -p /home/$username/$appdir/
run apt-get update -y && \
    apt-get install -y git
USER $username
workdir /home/$username/$appdir
run git clone https://github.com/priteshkumar/movielist.git
run cd movielist && npm install
expose PORT 3000
run node server.js
