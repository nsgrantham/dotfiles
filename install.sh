#!/bin/bash

DOTFILES=$HOME/.dotfiles


# Ask for confirmation before proceeding with installation

while true; do
  read -p "Warning: this will overwrite your current dotfiles in $HOME. Continue [yn]? " yn
  case $yn in
    [Yy]* ) break;;
    [Nn]* ) exit;;
    * ) echo "Please answer yes [y] or no [n].";;
  esac
done

declare -a FILES_TO_SYMLINK=(
  "git/.gitconfig"
  "git/.gitignore_global"
  "latex/.latexmkrc"
  "R/.Rprofile"
  "tmux/.tmux.conf" 
  "vim/.vim"
  "vim/.vimrc" 
  "zsh/.zshrc"
)

for file in "${FILES_TO_SYMLINK[@]}"; do
  source_file="$DOTFILES/$file"
  target_file="$HOME/${file##*/}"
  echo -n "Symlinking $source_file to $target_file ... "
  ln -sfn $source_file $target_file
  echo "Done."
done


# Perform macOS-specific installation

if [ "$(uname)" == "Darwin" ]; then
  
  if test ! $(which brew); then
    echo "Installing Homebrew... "
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo "Done."
  fi
  
  echo "Installing CLI and GUI programs from macos/Brewfile ... "
  brew bundle --file=macos/Brewfile
  echo "Done."
fi


# Set ZSH to default shell

echo -e "\nChange default shell to zsh installed with Homebrew! (Requires admin privileges)"
echo "  chsh -s /usr/local/bin/zsh"
