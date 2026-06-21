#!/usr/bin/env bash
set -e

DOTFILES_REPO="https://github.com/9ovindyadav/dotfiles"
DOTFILES_DIR="$HOME/dotfiles"

sudo apt update && sudo apt install -y git ansible

if [ ! -d "$DOTFILES_DIR" ]; then
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"
ansible-playbook ansible/playbook.yml --ask-become-pass
