FROM gitpod/workspace-full

RUN sudo apt-get -y update

RUN sudo apt-get -y install openssh-server

# Install the hpcc-systems platform.
WORKDIR /tmp

RUN wget https://cdn.hpccsystems.com/releases/CE-Candidate-8.2.24/bin/platform/hpccsystems-platform-community_8.2.24-1focal_amd64.deb
RUN sudo apt-get install -y --fix-missing ./hpccsystems-platform-community_8.2.24-1focal_amd64.deb
RUN rm -f hpccsystems-platform-community_8.2.24-1focal_amd64.deb
