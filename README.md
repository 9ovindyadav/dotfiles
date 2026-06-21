# dotfiles

Personal dotfiles for Ubuntu, managed with GNU Stow and bootstrapped with Ansible.

## Bootstrap (fresh Ubuntu machine)

```bash
curl -fsSL https://raw.githubusercontent.com/9ovindyadav/dotfiles/main/bootstrap.sh | bash
```

This will:
1. Install `git` and `ansible` via apt
2. Clone this repo to `~/dotfiles`
3. Run the Ansible playbook which:
   - Installs packages: `git`, `stow`, `vim`, `tmux`, `curl`, `wget`, `xclip`, `fzf`, `build-essential`, `unzip`
   - Installs dev tools: NVM, SDKMAN, Go, TPM (tmux plugin manager)
   - Symlinks all dotfiles into `$HOME` via `stow`

## Manual setup

### Prerequisites
```bash
sudo apt install git ansible
```

### Steps
```bash
git clone https://github.com/govindsvyadav/dotfiles ~/dotfiles
cd ~/dotfiles
ansible-playbook ansible/playbook.yml --ask-become-pass
```

## What's included

| File | Purpose |
|------|---------|
| `.bashrc` | Shell config, aliases, prompt |
| `.vimrc` | Vim settings |
| `.tmux.conf` | Tmux config with Catppuccin theme |
| `.gitconfig` | Git defaults and aliases |

## After first setup

Install tmux plugins by opening tmux and pressing `prefix + I` (capital i).

## Updating Go version

Edit `ansible/roles/tools/vars/main.yml` and change `go_version`.

## Note
- File structure mirrors `$HOME` — required for `stow` to work correctly
- `ansible/` and `bootstrap.sh` are excluded from stow via `.stow-local-ignore`
