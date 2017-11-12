# ==============================
#   Init
# ==============================

# Path to your oh-my-zsh configuration
ZSH=$HOME/.dotfiles/zsh/oh-my-zsh

# Path to a custom oh-my-zsh configuration
ZSH_CUSTOM=$HOME/.dotfiles/zsh/custom

# Set name of theme to load
# Look in $ZSH/themes or $ZSH_CUSTOM/themes
ZSH_THEME="nsgrantham"


# ==============================
#   Path
# ==============================
  
PATH=/usr/local/bin
PATH=${PATH}:$HOME/bin
PATH=${PATH}:/usr/bin
PATH=${PATH}:/bin
PATH=${PATH}:/usr/sbin
PATH=${PATH}:/sbin
PATH=${PATH}:/usr/local/texlive/2014/bin/x86_64-darwin

export PATH=${PATH}


# ==============================
#   Plugins
# ==============================

# Load plugins for additional functionality
# Look in $ZSH/plugins or $ZSH_CUSTOM/plugins

# List of all bundled plugins:
# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins

# If zsh-syntax-highlighting is included, it must be last

plugins=(
    git
    git-extra
    github
    zsh-syntax-highlighting
)

# Load plugins
source $ZSH/oh-my-zsh.sh


# ==============================
#   Aliases
# ==============================

# Reload zsh config
alias reload!="source ~/.zshrc"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# Neovim is the future of Vim
alias vim="nvim"

# Directory shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias docs="cd ~/Documents"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"

# List shortcuts
alias l="ls -lah ${colorflag}"
alias la="ls -AF ${colorflag}"
alias ll="ls -lFh ${colorflag}"
alias lld="ls -l | grep ^d"

# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Recursively delete `.DS_Store` files (only appear on Mac OS X & macOS)
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# File size
alias fs="stat -f \"%z bytes\""
