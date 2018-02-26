FROM golang

# copy ssh-config
COPY ssh-config /root/.ssh-config

# we use this all the time, so try to get a nice looking bash
COPY bashrc /root/.bashrc
RUN chmod u+x /root/.bashrc

# mount project
VOLUME /go
WORKDIR /go
