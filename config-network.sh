#! /usr/bin/bash 
sed -i "s|docker-username|$DOCKER_USERNAME|g" network.yaml
sed -i "s|docker-token|$DOCKER_TOKEN|g" network.yaml
sed -i "s|account_one|$ACCT_ONE|g" network.yaml
sed -i "s|account_two|$ACCT_TWO|g" network.yaml
sed -i "s|k8s-context|$K8S_CONTEXT|g" network.yaml
sed -i "s|vault-url|$VAULT_ADDR|g" network.yaml
sed -i "s|vault-token|$VAULT_TOKEN|g" network.yaml
sed -i "s|vault-path|$VAULT_PATH|g" network.yaml
sed -i "s|git-url|$GIT_URL|g" network.yaml
sed -i "s|git-branch|$GIT_BRANCH|g" network.yaml
sed -i "s|git-repo|$GIT_REPO|g" network.yaml
sed -i "s|git-username|$GIT_USERNAME|g" network.yaml
sed -i "s|git-token|$GIT_TOKEN|g" network.yaml
sed -i "s|git-email|$GIT_EMAIL|g" network.yaml
sed -i "s|git-key|$GIT_KEY|g" network.yaml

