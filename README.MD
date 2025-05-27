# K8S-DIAG

k8s-diag is an image to use for troubleshooting Kubernetes pods. The image includes the following packages out of the box:

- kubectl
- kustomize
- helm
- curl
- wget
- jq
- yq
- net-tools
- bash
- unzip
- gomplate
- awscli

## Usage

```bash
kubectl debug <POD_NAME> -it --image=alin4i/k8s-diag --target=<CONTAINER_NAME>
```
