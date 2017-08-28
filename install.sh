#!/bin/bash

DOTFILES=$HOME/.dotfiles

# Ask for confirmation before proceeding with installation

while true; do
  read -p "Warning: this will overwrite your current dotfiles in $HOME. Continue [y/n]? " yn
  case $yn in
    [Yy]* ) break;;
    [Nn]* ) exit;;
    * ) echo "Please answer yes [y] or no [n].";;
  esac
done

declare -a FILES_TO_SYMLINK=(
  "tmux/.tmux.conf" 
  "vim/.vim"
  "vim/.vimrc" 
  "zsh/.zshrc"
)

for file in "${FILES_TO_SYMLINK[@]}"; do
  source_file="$DOTFILES/$file"
  target_file="$HOME/${file##*/}"
  echo "Symlinking $source_file to $target_file"
  ln -sfn $source_file $target_file
done


# Perform macOS-specific installation

if [ "$(uname)" == "Darwin" ]; then
  echo -e "Setting Mac defaults"
  
  if test ! $(which brew); then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  
  brew bundle -v --file=macos/Brewfile
fi

# Set ZSH to default shell

echo "Changing default shell to zsh"
chsh -s $(which zsh)

echo "Done."
