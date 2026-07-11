#!/usr/bin/env bash

###############################################################################
# Enterprise Platform Bootstrap
#
# Description:
#   Bootstraps the local development environment for the
#   Enterprise Multi-Cloud Platform project.
#
# Author:
#   Sundeep Kumar
#
###############################################################################

set -euo pipefail

#############################################
# Versions
#############################################

TFLINT_VERSION="0.59.1"
TERRAFORM_DOCS_VERSION="0.20.0"

#############################################
# Colours
#############################################

RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
NC="\033[0m"

#############################################
# Helper Functions
#############################################

header() {

    echo
    echo -e "${BLUE}=================================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}=================================================${NC}"
    echo

}

info() {

    echo -e "${YELLOW}[INFO]${NC} $1"

}

success() {

    echo -e "${GREEN}[SUCCESS]${NC} $1"

}

error() {

    echo -e "${RED}[ERROR]${NC} $1"

}

#############################################
# Update Packages
#############################################

header "Updating Ubuntu Packages"

sudo apt update

#############################################
# Install Common Packages
#############################################

header "Installing Common Packages"

sudo apt install -y \
    curl \
    wget \
    git \
    unzip \
    jq \
    tree \
    python3-pip \
    pipx

#############################################
# Configure pipx
#############################################

header "Configuring Python Toolchain"

pipx ensurepath >/dev/null 2>&1 || true

if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' ~/.bashrc; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi

export PATH="$HOME/.local/bin:$PATH"

#############################################
# Install pre-commit
#############################################

header "Installing pre-commit"

if command -v pre-commit >/dev/null 2>&1; then

    success "pre-commit already installed."

else

    pipx install pre-commit

fi

#############################################
# Install Checkov
#############################################

header "Installing Checkov"

if command -v checkov >/dev/null 2>&1; then

    success "Checkov already installed."

else

    pipx install checkov

fi

#############################################
# Install TFLint
#############################################

header "Installing TFLint"

if command -v tflint >/dev/null 2>&1; then

    success "TFLint already installed."

else

    curl -fL \
    -o tflint_linux_amd64.zip \
    https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip

    unzip -oq tflint_linux_amd64.zip

    sudo mv tflint /usr/local/bin/

    rm -f tflint_linux_amd64.zip

    success "TFLint installed."

fi

#############################################
# Install terraform-docs
#############################################

header "Installing Terraform Docs"

if command -v terraform-docs >/dev/null 2>&1; then

    success "terraform-docs already installed."

else

    curl -fL \
    -o terraform-docs.tar.gz \
    https://github.com/terraform-docs/terraform-docs/releases/download/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-amd64.tar.gz

    tar -xzf terraform-docs.tar.gz

    sudo mv terraform-docs /usr/local/bin/

    rm -f terraform-docs.tar.gz

    rm -f LICENSE README.md

    success "terraform-docs installed."

fi

#############################################
# Environment Verification
#############################################

header "Development Environment"

printf "%-25s %s\n" "Terraform"       "$(terraform version | head -1)"
printf "%-25s %s\n" "Azure CLI"       "$(az version | jq -r '."azure-cli"')"
printf "%-25s %s\n" "AWS CLI"         "$(aws --version)"
printf "%-25s %s\n" "kubectl"         "$(kubectl version --client --short 2>/dev/null || kubectl version --client)"
printf "%-25s %s\n" "Helm"            "$(helm version --short)"
printf "%-25s %s\n" "GitHub CLI"      "$(gh --version | head -1)"
printf "%-25s %s\n" "TFLint"          "$(tflint --version | head -1)"
printf "%-25s %s\n" "Terraform Docs"  "$(terraform-docs --version)"
printf "%-25s %s\n" "pre-commit"      "$(pre-commit --version)"
printf "%-25s %s\n" "Checkov"         "$(checkov --version)"

#############################################
# Completed
#############################################

header "Bootstrap Completed Successfully"

success "Enterprise Platform development environment is ready."

echo
