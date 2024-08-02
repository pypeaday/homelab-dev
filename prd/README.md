# Production

This sub-folder is the ansible deployment I am migrating to from Ansible-NAS

## Goals

- Use tailscale sidecars with containers to remove as many public facing services as is reasonable
- Proper user / docker setup for a new machine. The ZFS side of things is assumed to be done (ie. datasets created for the different directory mappings)

## Assumptions

- ZFS datasets are created
- Any encryption is automatically decrypted
- Systemd is setup with dependencies such that docker doesn't start until ZFS datasets are mounted
