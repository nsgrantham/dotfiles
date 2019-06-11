#! /usr/bin/env bash

# git clone --recursive https://github.com/nsgrantham/dotfiles
# cd dotfiles
# ./install.sh

# Make directory to copy and store the existing dotfiles

old_dotfiles=$HOME/.old_dotfiles/$(date '+%Y-%m-%dT%H:%M:%S')
mkdir -p $old_dotfiles
echo "Existing dotfiles will be moved to $old_dotfiles"

# Create symbolic links of dotfiles to the home directory

symlink_to_home_dir () {
  if [ -f "$HOME/$1" ]; then
    cp -RL $HOME/$1 $old_dotfiles
  fi
  echo -n "Symlinking $1 to home directory ... "
  ln -sfn "$PWD/$1" "$HOME/$1"
  echo "Done."
}

symlink_to_home_dir .config
symlink_to_home_dir .gitconfig
symlink_to_home_dir .gitignore_global
symlink_to_home_dir .latexmkrc
symlink_to_home_dir .matplotlib
symlink_to_home_dir .npmrc
symlink_to_home_dir .Rprofile
symlink_to_home_dir .tmux.conf
symlink_to_home_dir .zshrc
symlink_to_home_dir zsh

# Create symbolic links of VS Code dotfiles to the app's user settings directory

vscode_user_settings="$HOME/Library/Application Support/Code/User"

cp -RL "$vscode_user_settings/settings.json" $old_dotfiles
cp -RL "$vscode_user_settings/keybindings.json" $old_dotfiles
cp -RL "$vscode_user_settings/snippets" $old_dotfiles

echo -n "Symlinking dotfiles for VS Code to its user settings directory ... "

ln -sfn "$PWD/.vscode/settings.json" "$vscode_user_settings/settings.json"
ln -sfn "$PWD/.vscode/keybindings.json" "$vscode_user_settings/keybindings.json"
ln -sfn "$PWD/.vscode/snippets" "$vscode_user_settings/snippets"
  
echo "Done."

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

