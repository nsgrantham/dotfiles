# nsgrantham.zsh-theme
# nsgrantham.com

local current_dir='${PWD/#$HOME/~}'

local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔︎"

PROMPT="
%{$terminfo[bold]$fg[white]%}${current_dir}%{$reset_color%} ${git_info}
%{$terminfo[bold]$fg[white]%}› %{$reset_color%}"
