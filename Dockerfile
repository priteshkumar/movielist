ARG VERSION=latest
from node:${VERSION}
label appversion="1.0"
label author="pritesh.kumar2@gmail.com"
label usesdb="mysql:8.0"
ENV npmuse=1
ENV node_env="testing"
ARG username="jenkins"
ARG appdir="nodeapps"
run useradd -ms /bin/bash $username
#run usermod -a -G wheel $username
run usermod -a -G sudo $username
run mkdir -p /home/${username}/${appdir}/
#run apt-get update -y && \
#    apt-get install -y git
run chown -R $username /home/${username}/${appdir}/
USER $username
workdir /home/${username}/${appdir}/
#run git clone https://github.com/priteshkumar/movielist.git -b nodb
run cd movielist && npm install
workdir movielist
expose 3000/tcp
entrypoint ["/bin/sh","-c","node server.js"]

