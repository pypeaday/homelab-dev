# homelab-dev

This is my homelab repo where I'm centralizing my application deployment for different things.
I've been using Ansible-NAS as my primary way of deploying applications but I want to start messing with quite a bit more than is built-in and I'd like to not maintain a heavy fork of the repo.

I will be migrating applications one by one into my own ansible roles in `./roles` and the playbook(s) will be in `./playbooks`.

The rest of this repo is for development things - trying to keep stuff organized by technology and keep notes. There's 2 "dev" ideas right now, one is all of the repo, the other is in using a dev server to deploy applications just like I would with my production environment - for now that's more of a theory than practice.

# Production

This the ansible deployment I am migrating to from Ansible-NAS

The Ansible-NAS project is great, I just want to tinker quite a bit more with each container now so I've taken a lot of the setup and design philosophy from that project to implement a solution closer to my end-goal.

## Goals

- Use tailscale sidecars with containers to remove as many public facing services as is reasonable
- Proper user / docker setup for a new machine. The ZFS side of things is assumed to be done (ie. datasets created for the different directory mappings)

## Assumptions

- ZFS datasets are created
- Any encryption is automatically decrypted
- Systemd is setup with dependencies such that docker doesn't start until ZFS datasets are mounted
- Bitwarden Secrets CLI is set. I'm using my .envrc file (ignored) to set my access token as well as an environment variable for the ansible vault key value in my vault.
- `just encrypt` before commit - I vault the entire inventory file out of simplicity

### Env Setup

Here's an example `.envrc` file you can use with direnv to automatically setup your shell so that `just <command> can use bitwarden secrets in deployment and you don't have to keep sensitive info all over the place

```bash
#!/bin/bash
# shortcut for creating new venv environments based on the current working directory
export envname=./.venv/$(basename $PWD)
venvenvnew() {
	python3 -m venv $envname
	source $envname/bin/activate
	python3 -m pip install --upgrade pip
	pip install pdbpp pyflyby

}
echo $(basename $PWD) | lolcat
source $envname/bin/activate || venvenvnew

# For Bitwarden Secrets Manager
export BWS_ACCESS_TOKEN=YOUR-BWS-ACCESS-TOKEN
export HOMELAB_BOT_VAULT_KEY_ID=KEY_ID_FOR_ANSIBLE_VAULT_KEY_IN_BWS
```


## Setup

### General

homelab-general sets up some basic server stuff

### Users

homelab-users setups the `"{{ homelab_user }}"` user (default: `homelab-user`)

### Docker

Installs docker and adds user to appropriate groups + installs LazyDocker

## Applications

Here is a list of applications I run in production, I will monitor which ones get moved over via this list

### Container Registry + UI

container registry is behind firewall, would like to add auth to push to it from GH actions so I don't have to setup my own self-hosted CI

### Traefik

### Manyfold

3D Printing library

link: https://manyfold.app/

### Portainer

### minio

### Jellystat

done

### Jellyfin

### Code Server

### Stats Stack

Grafana

Telegraf

Prometheus

Smartctl

### Ubooquity

### *Arr

Tdarr

Sonarr

Radarr

Prowlarr

Ombi

Lidarr

Readarr

Transmission with OpenVPN

### Gotify

Done

### Dashy

### Netdata

### Uptime Kuma

### Linkding

### Airsonic

### Kanboard

### Glnces

### Cloud Commander

### Paperless NGX

### Frigate

done

### Nextcloud

SMTP is handled via my Proton account
