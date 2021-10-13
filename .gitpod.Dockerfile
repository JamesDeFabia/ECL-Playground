FROM gitpod/workspace-full

USER root

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install openssh-server

# RUN groupadd -g 10001 hpcc
# RUN useradd -s /bin/bash -r -N -c "hpcc runtime User" -u 10000 -g hpcc hpcc
# RUN passwd -l hpcc 

# Install the hpcc-systems platform.
WORKDIR /tmp

RUN wget https://cdn.hpccsystems.com/releases/CE-Candidate-8.4.0/bin/platform/hpccsystems-platform-community_8.4.0-2focal_amd64.deb
RUN apt-get install -y --fix-missing ./hpccsystems-platform-community_8.4.0-2focal_amd64.deb
RUN rm -f hpccsystems-platform-community_8.4.0-2focal_amd64.deb
