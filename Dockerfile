# Use a lightweight Alpine-based image
FROM alpine:3.21

# Set environment variables for non-interactive installation
ENV KUSTOMIZE_VERSION="v5.5.0" \
  HELM_VERSION="v3.16.4" \
  GOMPLATE_VERSION="v4.3.0" \
  YQ_VERSION="v4.44.6"

# Install dependencies and tools
RUN apk add --no-cache \
  curl \
  wget \
  jq \
  vim \
  net-tools \
  bash \
  unzip \
  && curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
  && chmod +x kubectl && mv kubectl /usr/local/bin/ \
  && curl -LO "https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz" \
  && tar -xzf kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz -C /usr/local/bin && rm kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz \
  && curl -LO "https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz" \
  && tar -xzf helm-${HELM_VERSION}-linux-amd64.tar.gz && mv linux-amd64/helm /usr/local/bin/ && rm -r linux-amd64 helm-${HELM_VERSION}-linux-amd64.tar.gz \
  && curl -LO "https://github.com/hairyhenderson/gomplate/releases/download/${GOMPLATE_VERSION}/gomplate_linux-amd64-slim" \
  && chmod +x gomplate_linux-amd64-slim && mv gomplate_linux-amd64-slim /usr/local/bin/gomplate \
  && curl -LO "https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64" \
  && chmod +x yq_linux_amd64 && mv yq_linux_amd64 /usr/local/bin/yq \
  && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
  && unzip awscliv2.zip && ./aws/install && rm -rf awscliv2.zip aws/ \
  && apk del unzip \
  && rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

# Set default command
CMD ["bash"]
