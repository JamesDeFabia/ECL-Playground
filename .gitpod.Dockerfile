FROM gitpod/workspace-full

RUN sudo apt-get -y update

# Install the hpcc-systems platform.
WORKDIR /tmp

# RUN wget https://cdn.hpccsystems.com/releases/CE-Candidate-8.4.12/bin/platform/hpccsystems-platform-community_8.4.12-1focal_amd64.deb
# RUN wget https://cdn.hpccsystems.com/releases/CE-Candidate-8.6.30/bin/platform/hpccsystems-platform-community_8.6.30-1focal_amd64.deb
# RUN sudo apt-get install -y --fix-missing ./hpccsystems-platform-community_8.4.12-1focal_amd64.deb
# RUN sudo apt-get install -y --fix-missing ./hpccsystems-platform-community_8.6.30-1focal_amd64.deb
# RUN rm -f hpccsystems-platform-community_8.4.12-1focal_amd64.deb
# RUN rm -f hpccsystems-platform-community_8.6.30-1focal_amd64.deb

# RUN wget https://github.com/hpcc-systems/HPCC-Platform/releases/download/community_9.0.0-1/hpccsystems-platform-community_9.0.0-1focal_amd64_withsymbols.deb
# RUN sudo apt-get install -y --fix-missing ./hpccsystems-platform-community_9.0.0-1focal_amd64_withsymbols.deb
#
# RUN rm -f hpccsystems-platform-community_9.0.0-1focal_amd64_withsymbols.deb
############################

RUN wget https://github.com/hpcc-systems/HPCC-Platform/releases/download/community_9.8.32-1/hpccsystems-platform-community_9.2.12-1focal_amd64_withsymbols.deb
RUN sudo apt-get install -y --fix-missing ./hpccsystems-platform-community_9.8.32-1focal_amd64_withsymbols.deb

RUN rm -f hpccsystems-platform-community_9.8.32-1focal_amd64_withsymbols.deb

###########################

COPY ./environment/*.xml /etc/HPCCSystems
