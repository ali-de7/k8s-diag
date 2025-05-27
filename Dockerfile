# Use a lightweight Alpine-based image
FROM alpine:latest

# Install dependencies and tools
# Install base packages
RUN apk add --no-cache bash
RUN apk add --no-cache vim
RUN apk add --no-cache python3 py3-pip
RUN apk add --no-cache openssl
RUN apk add --no-cache net-tools
RUN apk add --no-cache unzip
RUN apk add --no-cache curl
RUN apk add --no-cache wget
RUN apk add --no-cache jq

# Install kubectl (latest stable)
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
  && chmod +x kubectl \
  && mv kubectl /usr/local/bin/

# Install kustomize
RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash

# Install Helm
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 \
  && chmod 700 get_helm.sh \
  && ./get_helm.sh

# Install gomplate
RUN apk add --no-cache gomplate

# Install yq
RUN apk add yq

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip \
  && ./aws/install \
  && rm -rf awscliv2.zip aws/

# Cleanup
RUN apk del unzip \
  && rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

# Set default command
CMD ["bash"]
