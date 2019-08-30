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
run chown -R $username /home/${username}/${appdir}/
USER $username
copy . /home/${username}/${appdir}/moviapp
workdir /home/${username}/${appdir}/moviapp
run npm install

expose 3000/tcp
entrypoint ["/bin/sh","-c","node server.js"]

