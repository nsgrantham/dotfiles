# nsgrantham.zsh-theme
#
# Modified from xxf.zsh-theme at github.com/xfanwu/oh-my-zsh-custom-xxf
# Tested on Linux and Unix under ANSI colors.
# Recommended for use with a dark background and the Inconsolata font.
#
# Colors: 
# blue (USER), cyan (MACHINE), magenta (DIRECTORY), yellow (BRANCH)
# red (STATE), green (STATE), white (TIME & COMMAND)
# 
# Prompt format: 
# USER at MACHINE in [DIRECTORY] on git:BRANCH STATE 
# TIME › COMMAND
#
# For example:
# nsgrantham at nsgrantham-machine in [~/.dotfiles] on git:master x
# 00:00:00 ›
#
# Aug 2017
# Neal S. Grantham

local current_dir='${PWD/#$HOME/~}'

local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}on%{$reset_color%} git:%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔︎"

PROMPT="
%{$fg[blue]%}%n \
%{$fg[white]%}at \
%{$fg[cyan]%}%m \
%{$fg[white]%}in \
%{$terminfo[bold]$fg[magenta]%}[${current_dir}]%{$reset_color%} \
${git_info}
%{$fg[white]%}%* \
%{$terminfo[bold]$fg[white]%}› %{$reset_color%}"
