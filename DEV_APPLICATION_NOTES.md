# DEV NOTES

My repo for experimentation in a dev environment in my homelab

Here I will plan to play around with k8s/k3s, helm, terraform, kompose, etc.

```ini
host koober
  User dumbledore
  HostName 192.168.1.31
  PubkeyAuthentication no
```

0. Had to set INSTALL_K3S_VERSION="v1.24.10+k3s1" since Rancher wasn't
   compativle with k3s>1.27.0 which was installed at first
1. Installed k3s with `curl -sfL https://get.k3s.io |
INSTALL_K3S_VERSION=$INSTALL_K3S_VERSION sh -s - server --cluster-init`
2. Installed `brew` with `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
3. Insalled k9s with `brew install derailed/k9s/k9s`

## Vault

### Install

Helm installed with `helm repo add hashicorp https://helm.releases.hashicorp.com`
Then

```
helm install vault hashicorp/vault --namespace vault --create-namespace

`helm upgrade vault hashicorp/vault --values ./vault-helm/values.yaml -n vault`

`helm upgrade vault --set server.standalone.config='{ listener "tcp" { tsl_disable = 0 }'`
```

### Port forward

k9s did this for me but codeium thinks below would do it?
`kubectl port-forward vault-0 8200:8200`

"http://localhost:8200" gives me the UI.... amazing

root token: $VAULT_ROOT_TOKEN
key 1: $VAULT_KEY

### Install CLI

Link to docs:

https://developer.hashicorp.com/vault/tutorials/getting-started/getting-started-install#install-vault

For Ubuntu:

sudo apt update && sudo apt install gpg
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

## Rancher

Trying to follow instructions on rancher website, I have a script in
`./rancher` but I can't get it working, I see an error via k9s

```
│   Warning  Unhealthy  34m   kubelet            Readiness probe failed: Get "http://10.42.0.13:80/healthz": dial tcp 10.42 │
│ .0.13:80: connect: connection refused


## Uptime Kuma

I couldn't even get this one deployed... PVCs never came online and I didn't want to debug that... it's deployed via ansible in prod


## Onedev

Project management and stuff. CI/CD that looks simple enough but it's not what I need and I'm not ready to move all my git repos to it
```