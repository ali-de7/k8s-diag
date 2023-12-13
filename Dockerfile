# Use the Alpine Linux base image
FROM alpine:3.19.0

# Install required packages
RUN apk --update --no-cache add \
    bash \
    kubectl \
    helm \
    gomplate \
    kustomize \
    curl \
    wget \
    yq \
    jq \
    bind-tools \
    aws-cli \
    net-tools \
    apache2 \
    nginx

# Additional configuration or commands can be added here

# Start the default service (e.g., nginx in this case)
CMD ["nginx", "-g", "daemon off;"]
