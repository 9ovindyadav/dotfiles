case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
HISTSIZE=10000
HISTFILESIZE=20000
shopt -s histappend checkwinsize

export EDITOR=vim
export VISUAL=vim

parse_git_branch() {
    git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ "$color_prompt" = yes ]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[91m\]$(parse_git_branch)\[\033[00m\]\$ '
else
    PS1='\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt

case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;\u@\h: \w\a\]$PS1"
        ;;
esac

alias ls='ls --color=auto'
alias ll='ls -lhF --color=auto'
alias la='ls -lAhF --color=auto'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias gs='git status'
alias gd='git diff'
alias gl='git log --oneline --graph --decorate'

if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

[ -f ~/.bash_aliases ] && . ~/.bash_aliases

export NVM_DIR="$HOME/.nvm"
nvm() {
    unset -f nvm
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm "$@"
}

export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin"
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
