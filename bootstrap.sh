#!/usr/bin/env bash
set -e

DOTFILES_REPO="https://github.com/9ovindyadav/dotfiles"
DOTFILES_DIR="$HOME/dotfiles"

read -r -s -p "[sudo] password for $USER: " sudo_pass
echo
echo "$sudo_pass" | sudo -S true 2>/dev/null || { echo "Incorrect password."; exit 1; }

echo "$sudo_pass" | sudo -S apt update && echo "$sudo_pass" | sudo -S apt install -y git ansible

if [ ! -d "$DOTFILES_DIR" ]; then
    git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"

become_file=$(mktemp)
chmod 600 "$become_file"
printf 'ansible_become_pass: %s\n' "$sudo_pass" > "$become_file"
unset sudo_pass

ANSIBLE_CONFIG="$DOTFILES_DIR/ansible/ansible.cfg" ansible-playbook ansible/playbook.yml -e "@$become_file"
rm -f "$become_file"
