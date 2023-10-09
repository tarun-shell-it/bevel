#! /usr/bin/bash 

# Add your GHCR username
export DOCKER_USERNAME="tarun-shell-it"

# Add your GHCR token
export DOCKER_TOKEN="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"

# Add account IDs for each account creted on Metamask earlier in training
# Do NOT include "0x" prefix
export ACCT_ONE="054bd939dCD7081D66Bd9645D554ACb913C49864"
export ACCT_TWO="216eCa21048F8a42Ecb0d0Ff13C2Cece26A56407"

# Replace if K8s cluster name is different than besu-training
export K8S_CONTEXT="sep-aks-bevel"

# Replace with your Vault address
export VAULT_ADDR="http://20.126.171.25:8200"

# Add your root token for Vault
export VAULT_TOKEN="hvs.6XY5LOzVdI8DX7jTOq2gO5Wl"

# Replace if your vault path is different than secretsv2
export VAULT_PATH="secretsv2"

# Replace "user-name" with your GitHub username
export GIT_URL="ssh://git@github.com/tarun-shell-it/bevel.git"

# Update if using a different git branch than the training
export GIT_BRANCH="feature/from-develop"

# Replace "user-name" with your GitHub username
export GIT_REPO="github.com/tarun-shell-it/bevel.git"

# Update with GitHub username
export GIT_USERNAME="tarun-shell-it"

# Optional; update with Git token
export GIT_TOKEN=""

# Update with GitHub email associated with GitHub account
export GIT_EMAIL="Tarun.Jethwani@shell.com"

# Update if you names the GitHub ssh key differently
export GIT_KEY="/home/bevel-user/bevel/build/id_rsa_gitops"