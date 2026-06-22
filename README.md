# dotfiles

A developer-focused machine bootstrap toolkit. Run one command on a fresh machine and get a fully configured development environment in minutes — shell, editor, terminal multiplexer, Kubernetes tools, runtimes, and apps all set up automatically via Ansible.

Designed to be reusable across teams so any developer can onboard a new machine without manual setup.

## Supported OS

| OS | Status |
|---|---|
| Ubuntu 22.04+ | Supported |
| Debian 12+ | Planned |
| Fedora | Planned |
| Arch Linux | Planned |
| AlmaLinux | Planned |
| CentOS Stream | Planned |

## Quick Start

> **One command to set up your entire machine:**

```bash
curl -fsSL https://raw.githubusercontent.com/9ovindyadav/dotfiles/main/bootstrap.sh | bash
```

That's it. The script installs `git` and `ansible`, clones the repo, and runs the full playbook automatically.

Or clone manually:

```bash
git clone https://github.com/9ovindyadav/dotfiles ~/dotfiles
cd ~/dotfiles
./bootstrap.sh
```

## What Gets Installed

**System Packages**

| Package | Purpose |
|---|---|
| `git` | Version control |
| `vim` | Terminal editor |
| `tmux` | Terminal multiplexer |
| `stow` | Dotfile symlink manager |
| `fzf` | Fuzzy finder |
| `jq` | JSON processor |
| `htop` | Process monitor |
| `curl` / `wget` | HTTP clients |
| `rsync` | File sync |
| `xclip` | Clipboard integration |
| `podman` | Rootless containers |
| `build-essential` | C/C++ compiler toolchain |
| `cmake` / `ccache` | Build tools |
| `gnupg` | GPG encryption |
| `openssh-client` | SSH client |
| `unzip` / `zip` | Archive tools |

**Development Runtimes**

| Runtime | Manager | Version |
|---|---|---|
| Node.js | NVM | 24 |
| Java | SDKMAN | 27 |
| Go | Direct binary | 1.26.4 |
| Docker | Official install script | Latest |

**Kubernetes Tools**

| Tool | Purpose |
|---|---|
| `kubectl` | Kubernetes CLI (latest stable) |
| `helm` | Kubernetes package manager |
| `k9s` | Terminal UI for Kubernetes |

All installed with architecture detection for `amd64` and `arm64`.

**Applications**

| App | Purpose |
|---|---|
| Brave | Privacy-focused browser |
| Bitwarden | Password manager |
| Zed | Code editor |
| Sublime Merge | Git GUI client |
| VLC | Media player |

**Dotfiles**

| File | Purpose |
|---|---|
| `.bashrc` | Shell config with git prompt, aliases, lazy NVM/SDKMAN loading |
| `.vimrc` | Vim configuration |
| `.tmux.conf` | Tmux with Catppuccin theme and TPM plugin manager |
| `.gitconfig` | Git aliases, default branch, rebase settings |

All symlinked into `$HOME` via [GNU Stow](https://www.gnu.org/software/stow/).

## How It Works

The bootstrap is a single `bootstrap.sh` script that installs `git` and `ansible`, clones the repo, and runs the Ansible playbook. The playbook is structured into four roles you can run selectively via tags:

```
ansible/
└── roles/
    ├── packages/   # apt packages
    ├── dotfiles/   # stow symlinks
    ├── tools/      # runtimes + k8s tools
    └── apps/       # GUI applications
```

```bash
# Install only packages and dotfiles (fast)
ansible-playbook ansible/playbook.yml --tags packages,dotfiles

# Install only Kubernetes tools
ansible-playbook ansible/playbook.yml --tags tools
```

Versions are centralized in `ansible/roles/tools/vars/main.yml` — change one file to standardize a runtime version across the whole team.

## Updating versions

All pinned versions live in `ansible/roles/tools/vars/main.yml`:

```yaml
tools_go_version: "1.26.4"
tools_node_version: "24"
tools_java_version: "27.ea.25-open"
```

## Contributing

Contributions are welcome! If you need a tool, runtime, or app added — or want to request a feature — [open an issue](https://github.com/9ovindyadav/dotfiles/issues) on GitHub. For bug fixes or improvements, feel free to send a pull request.
