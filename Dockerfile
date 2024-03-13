# The ubuntu:latest tag points to the "latest LTS", PRETTY_NAME="Ubuntu 22.04.3 LTS", jammy
# FROM ubuntu:latest
FROM ubuntu:jammy

# # COPY openssl.tar.gz /

# Environment Variables for p4 (only stored on inital build)
ARG P4PORT=<server>:<port>
ARG P4USER=<username>
ARG P4PASSWD=<password>
ARG P4CLIENT=<clientname on client>

# Set environment variables (stored in image after up & running)
ENV P4PORT=$P4PORT
ENV P4USER=$P4USER
ENV P4PASSWD=$P4PASSWD
ENV P4CLIENT=$P4CLIENT

WORKDIR /root

# Add packages
RUN apt update && apt upgrade -y
RUN apt install wget gpg sudo -y
# optional packages for debugging common issues
RUN apt install curl vim procps iputils-ping bash-completion -y
# Add Perforce HelixCore packages
RUN wget -qO - https://package.perforce.com/perforce.pubkey | gpg --dearmor | sudo tee /usr/share/keyrings/perforce.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/perforce.gpg] https://package.perforce.com/apt/ubuntu  jammy  release" > /etc/apt/sources.list.d/perforce.list
RUN apt update && apt install helix-p4d -y
# TODO: cleanup repo

# Setup repo - https://www.perforce.com/manuals/p4guide/Content/P4Guide/chapter.tutorial.html
# RUN export P4PORT=54.185.85.184:1967 && export P4USER=barnesm && export P4PASSWD=barnesmpw! && export P4CLIENT=WebGLChat
# NOTE: env vars come in from docker-compose.yaml
RUN echo 'echo $P4PASSWD| p4 login && p4 info >> p4_repo.log' > /root/p4_conn.sh && chmod +x /root/p4_conn.sh
RUN sh /root/p4_conn.sh
# p4 client -S //JamCode/main
# RUN p4 logout

# https://www.perforce.com/manuals/p4sag/Content/P4SAG/install.linux.packages.configure.html



ENTRYPOINT ["/bin/bash"]
