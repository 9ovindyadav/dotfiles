# dotfiles

Personal dotfiles and machine bootstrap for development, managed with GNU Stow and Ansible.

## Bootstrap

### Ubuntu 22.04+

```bash
curl -fsSL https://raw.githubusercontent.com/9ovindyadav/dotfiles/main/bootstrap.sh | bash
```

This will:
1. Install `git` and `ansible` via apt
2. Clone this repo to `~/dotfiles`
3. Run the Ansible playbook (packages → dotfiles → tools → apps)

### Manual setup

```bash
sudo apt install git ansible
git clone https://github.com/9ovindyadav/dotfiles ~/dotfiles
cd ~/dotfiles
ansible-playbook ansible/playbook.yml --ask-become-pass
```

### Run specific roles only

```bash
# Only packages and dotfiles (fast)
ansible-playbook ansible/playbook.yml --tags packages,dotfiles --ask-become-pass

# Only tools
ansible-playbook ansible/playbook.yml --tags tools --ask-become-pass

# Only apps
ansible-playbook ansible/playbook.yml --tags apps --ask-become-pass
```

## Supported OS

| OS | Status |
|----|--------|
| Ubuntu 22.04+ | ✅ Supported |
| Debian 12+ | ⚠️ Untested (should work) |
| CentOS / AlmaLinux / Arch | 🚧 Planned |

## What's included

### Dotfiles

| File | Purpose |
|------|---------|
| `.bashrc` | Shell config, aliases, git prompt |
| `.vimrc` | Vim settings |
| `.tmux.conf` | Tmux with Catppuccin theme and TPM plugins |
| `.gitconfig` | Git defaults and aliases |

### Packages

| Package | Purpose |
|---------|---------|
| `vim` | Text editor |
| `tmux` | Terminal multiplexer |
| `git` | Version control |
| `stow` | Dotfile symlink manager |
| `fzf` | Fuzzy finder |
| `jq` | JSON processor |
| `htop` | Process monitor |
| `curl` / `wget` | HTTP clients |
| `xclip` | Clipboard support |
| `rsync` | File sync |
| `cmake` / `make` | Build tools |
| `ccache` | Compiler cache |
| `gnupg` | GPG encryption |
| `openssh-client` | SSH client |
| `podman` | Container runtime (rootless) |
| `build-essential` | C/C++ compiler toolchain |

### Dev tools

| Tool | Version | Purpose |
|------|---------|---------|
| Node.js | 24 (via NVM) | JavaScript runtime |
| Java | 27.ea.25-open (via SDKMAN) | JDK |
| Go | 1.26.4 | Go runtime |
| Docker | latest | Container runtime |
| kubectl | latest stable | Kubernetes CLI |
| Helm | latest | Kubernetes package manager |
| k9s | latest | Kubernetes TUI |
| TPM | latest | Tmux plugin manager |

### Apps

| App | Purpose |
|-----|---------|
| Brave | Web browser |
| Bitwarden | Password manager |
| Zed | Code editor |
| Sublime Merge | Git GUI client |
| VLC | Media player |

## After first setup

- **Tmux plugins**: open tmux and press `prefix + I` (capital i) to install TPM plugins
- **NVM**: restart shell or run `source ~/.bashrc` for `nvm` to be available
- **SDKMAN**: restart shell or run `source ~/.bashrc` for `sdk` to be available

## Updating versions

All pinned versions live in `ansible/roles/tools/vars/main.yml`:

```yaml
tools_go_version: "1.26.4"
tools_node_version: "24"
tools_java_version: "27.ea.25-open"
```
