# Dotfiles

Dotfiles are plain text files that configure the settings of programs in Unix/Linux systems, 
such as macOS, Ubuntu, etc. They tend to live in a user's home directory and are 
named with a leading `.` to keep them hidden from the file system (hence the name __dotfiles__).

This collection of dotfiles is designed to improve my workflow as a statistician / data scientist 
who specializes in scientific computing, visualization, and reproducible research. Your mileage may vary.

## Installation

```bash
$ git clone --recursive https://github.com/nsgrantham/dotfiles ~/.dotfiles
$ cd ~/.dotfiles
$ chmod +x install.sh
$ ./install.sh
```

## Components

- [vim](vim/README.md)
- [zsh](zsh/README.md)
- [tmux](tmux/README.md)
- [macOS](macos/README.md)
