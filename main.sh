#!/bin/bash

VERSION_DSBULK=1.11.0
VERSION_DSE=6.9.11

# Install packages
microdnf install gcc glibc-all-langpacks

# Install uv
curl -LsSf https://astral.sh/uv/install.sh | sh
source ~/.local/bin/env

# Install Python 3.11 and required distribution packages
uv venv --python 3.11 --seed
source .venv/bin/activate

# Install ibm-techxchange-2025-lab-2507-post-install-hook distribution package
# (netifaces cannot be compiled when using uv)
pip install cloud-pak-operations-cli

# Run Ansible playbook
ansible-playbook playbooks/install-dse.yaml --extra-vars "version_dsbulk=${VERSION_DSBULK} version_dse=${VERSION_DSE}"
