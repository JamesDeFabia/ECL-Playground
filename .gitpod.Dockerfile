FROM gitpod/workspace-full

USER root

RUN apt-get -y update
RUN apt-get -y install curl 

RUN groupadd -g 10001 hpcc
RUN useradd -s /bin/bash -r -N -c "hpcc runtime User" -u 10000 -g hpcc hpcc
RUN passwd -l hpcc 

WORKDIR /tmp
RUN curl: curl -s https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh

# Install the hpcc-systems platform.
RUN helm repo add hpcc https://hpcc-systems.github.io/helm-chart/
RUN helm install mycluster hpcc/hpcc --set global.image.version=latest

# RUN wget https://cdn.hpccsystems.com/releases/CE-Candidate-8.4.0/bin/platform/hpccsystems-platform-community_8.4.0-2focal_amd64.deb
# RUN apt-get install -y --fix-missing ./hpccsystems-platform-community_8.4.0-2focal_amd64.deb
# RUN rm -f hpccsystems-platform-community_8.4.0-2focal_amd64.deb
