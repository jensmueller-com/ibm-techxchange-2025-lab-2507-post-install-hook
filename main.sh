#!/bin/bash

VERSION_DSBULK=1.11.0
VERSION_DSE=6.9.13

# Install glibc-all-langpacks package (required by ansible-playbook)
microdnf install glibc-all-langpacks

# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh
source ~/.local/bin/env

# Install Python 3.11
uv venv --python 3.11
source .venv/bin/activate

# Install Cloud Pak Operations CLI
uv pip install cloud-pak-operations-cli

# Run Ansible playbook
ansible-playbook playbooks/install-dse.yaml --extra-vars "version_dsbulk=${VERSION_DSBULK} version_dse=${VERSION_DSE}"
