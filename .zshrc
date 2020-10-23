# ==============================
#   Init
# ==============================

# Path to your ohmyzsh configuration
ZSH=$HOME/.zsh/ohmyzsh

# Path to a custom oh-my-zsh configuration
ZSH_CUSTOM=$HOME/.zsh/custom

# Set name of theme to load
# Look in $ZSH/themes or $ZSH_CUSTOM/themes
ZSH_THEME="nsgrantham"

# Ignore permission issues and load the 
# completion system normally.
ZSH_DISABLE_COMPFIX=true

# ==============================
#   Path
# ==============================

export GEM_HOME=$HOME/gems
  
PATH=$HOME/bin
PATH=$PATH:$HOME/Library/Python/3.6/bin
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/local/opt/ruby/bin
PATH=$PATH:/usr/local/texlive/2018/bin/x86_64-darwin
PATH=$PATH:$GEM_HOME/bin
PATH=$PATH:/usr/bin
PATH=$PATH:/usr/sbin
PATH=$PATH:/bin
PATH=$PATH:/sbin

export PATH


# ==============================
#   Plugins
# ==============================

# Load plugins for additional functionality
# Look in $ZSH/plugins or $ZSH_CUSTOM/plugins

# List of all bundled plugins:
# https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins

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

# Neovim is the future of Vim
alias vim="nvim"

# Directory shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Detect which `ls` flavor is in use
#if ls --color > /dev/null 2>&1; then # GNU `ls`
#    colorflag="--color"
#else # OS X `ls`
#    colorflag="-G"
#fi

# List shortcuts
#alias l="ls -lah ${colorflag}"
#alias la="ls -AF ${colorflag}"
#alias ll="ls -lFh ${colorflag}"
#alias lld="ls -l | grep ^d"
alias l="exa --all --long --header --git --blocks --color-scale --time-style=long-iso"
alias ll="l --tree --level=2"
alias lll="l --tree --level=3"


# Helpers
alias grep='grep --color=auto'
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Recursively delete macOS `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Keep Homebrew neat and tidy
# https://gist.github.com/indiesquidge/ec010eca3ffa254788c2
alias brewup="brew update; brew upgrade; brew cleanup; brew doctor"

# File size
alias fs="stat -f \"%z bytes\""

# Activate virtual environment
alias activate="source venv/bin/activate"

