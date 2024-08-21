# Production

This sub-folder is the ansible deployment I am migrating to from Ansible-NAS

The Ansible-NAS project is great, I just want to tinker quite a bit more with each container now so I've taken a lot of the setup and design philosophy from that project to implement a solution closer to my end-goal.

## Goals

- Use tailscale sidecars with containers to remove as many public facing services as is reasonable
- Proper user / docker setup for a new machine. The ZFS side of things is assumed to be done (ie. datasets created for the different directory mappings)

## Assumptions

- ZFS datasets are created
- Any encryption is automatically decrypted
- Systemd is setup with dependencies such that docker doesn't start until ZFS datasets are mounted
- Bitwarden Secrets CLI is set. I'm using my .envrc file (ignored) to set my access token as well as an environment variable for the ansible vault key value in my vault.

## Setup

### General

homelab-general sets up some basic server stuff

### Users

homelab-users setups the `"{{ homelab_user }}"` user (default: `homelab-user`)

### Docker

Installs docker and adds user to appropriate groups + installs LazyDocker

## Applications

Here is a list of applications I run in production, I will monitor which ones get moved over via this list

### Traefik

### Portainer

### minio

### Jellystat

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
