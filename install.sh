#! /usr/bin/env bash

# This script must be run directly from the dotfiles repository:
# cd path/to/dotfiles
# ./install.sh

# Create symbolic links of dotfiles to home directory

old_dotfiles=$HOME/.old_dotfiles/$(date '+%Y-%m-%dT%H:%M:%S')
mkdir -p $old_dotfiles
echo "Existing dotfiles will be moved to $old_dotfiles"

symlink_to_home_dir () {
  if [ -f "$HOME/$1" ]; then
    cp -R $HOME/$1 $old_dotfiles
  fi
  echo -n "Symlinking $1 ... "
  ln -sfn "$PWD/$1" "$HOME/$1"
  echo "Done."
}

symlink_to_home_dir .gitconfig
symlink_to_home_dir .gitignore_global
symlink_to_home_dir .latexmkrc
symlink_to_home_dir .matplotlib/matplotlibrc
symlink_to_home_dir .Rprofile
symlink_to_home_dir .tmux.conf
symlink_to_home_dir .config
symlink_to_home_dir .zshrc
symlink_to_home_dir zsh

# Perform macOS-specific installation

if [ "$(uname)" == "Darwin" ]; then
  echo -e "Installing programs from Brewfile... "
  brew bundle --file=Brewfile
  echo -e "Done."
  source .macos
fi

# Set zsh to default shell

if [ -z "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
  sudo sh -c "echo $(which zsh) >> /etc/shells"
  chsh -s "$(which zsh)"
fi 

