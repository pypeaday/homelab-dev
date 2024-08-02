# homelab-dev

This is my homelab repo where I'm centralizing my application deployment for different things.
I've been using Ansible-NAS as my primary way of deploying applications but I want to start messing with quite a bit more than is built-in and I'd like to not maintain a heavy fork of the repo. 

I will be migrating applications one by one into my own ansible roles in `./prd/roles` and the playbook(s) will be in `./prd/playbooks`.

The rest of this repo is for development things - trying to keep stuff organized by technology and keep notes. There's 2 "dev" ideas right now, one is all of the repo, the other is in using a dev server to deploy applications just like I would with my production environment - for now that's more of a theory than practice.
