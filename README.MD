# K8S-DIAG

k8s-diag is an image to use for troubleshooting Kubernetes pods. The image includes the following packages out of the box:

#### Base packages

- bash
- vim
- python3 py3-pip
- openssl
- net-tools
- unzip
- curl
- wget
- jq

#### Yaml Tools

- gomplate
- yq

#### Kubernetes CLI Tools

- kubectl
- kustomize
- helm

#### Cloud CLI Tools

- aws cli (v2)
- azure cli

## Usage

```bash
kubectl debug <POD_NAME> -it --image=alin4i/k8s-diag --target=<CONTAINER_NAME>
```
