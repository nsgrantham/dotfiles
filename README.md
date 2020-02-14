# Dotfiles

Dotfiles are plain text files that configure the settings of programs in Unix/Linux systems, such as macOS, Ubuntu, etc. They tend to live in a user's home directory and are named with a leading `.` to keep them hidden from the file system (hence the name *dot*files).

This collection of dotfiles is designed to improve my workflow as a statistician / data scientist who specializes in scientific computing, visualization, and reproducible research. Your mileage may vary.

## Installation

1. Install [Homebrew](https://brew.sh).

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

2. Install `git`.

```bash
brew install git
```

3. Run the install script to symlink dotfiles to the home directory and change the shell to Zsh.

```bash
git clone --recursive https://github.com/nsgrantham/dotfiles
cd dotfiles
./install.sh
```

4. Download my public GitHub repositories (make sure to change the username here)

```bash
./clone-public-github-repos.sh nsgrantham
```

## What do these dotfiles do?

I'm so glad you asked! Below I describe the files by the programs they modify.

### Git

`.gitconfig` configures git for your personal use (Check out Michael Wales' 
[Make .gitconfig Work for You](http://michaelwales.com/articles/make-gitconfig-work-for-you/) 
for a great overview). If you use this file, **make sure to change
user.name, user.email, and github.user!** Further settings change the terminal colors 
for several git subcommands and provide several useful aliases, such as `git unstage` 
which removes all files from staging, and `git graph` and `git graph2` which visualize 
the full commit history of your repo across all branches.

`.gitignore_global` excludes files from version control that are specific to 
operating systems and text editors, taken from [https://github.com/github/gitignore/Global](https://github.com/github/gitignore/Global).
For helpful lists of project-specific files to exclude, visit [https://github.com/github/gitignore](https://github.com/github/gitignore).


### LaTeX

LaTeX is a typesetting program for creating documents that benefit from explicit formatting rules and usually contain mathematical formulas. It can be a huge pain at times, but the results look great and it sure beats working in Microsoft Word. :)


[Latexmk](https://www.ctan.org/pkg/latexmk/) is a Perl program that automates the process behind generating a pdf document from tex and is included with most LaTeX installations. 
It can be [configured to interact with Skim](http://mg.readthedocs.io/latexmk.html#configuration-files), a pdf previewer for macOS, allowing the pdf to update automatically with saved changes to the tex file, and 
`.latexmkrc`.

I almost exclusively compile documents with XeLaTeX (rather than PDFLaTeX) because it accepts graphic formats like png without any fiddling. Thus,`.latexmkrc` forces latexmk to compile with XeLaTeX without the need to specify `latexmk --xelatex` every time.


### R

`.Rprofile` is automatically loaded in every new R session. If you use this file, **change devtools.name and devtools.desc.author!** 

Be thoughtful about which packages
and functions you choose to include, as any code you share may not set up the same 
R environment as your `.Rprofile`, making your code unreproducible! With this in mind, my `.Rprofile` 
only loads [devtools](https://github.com/hadley/devtools), configures its options, 
and defines `.quit()` which exits the R session without saving the current workspace.


### macOS

System preferences in macOS are modified in `.macOS`.

Moreover, Homebrew installs the programs listed in `Brewfile`.


### Tmux

Tmux is a terminal multiplexer which can manage multiple sessions within a single terminal window.

When starting a new project, I enter `tmux new -s my-project-name` to create a new session which I can set up however I want. To detach from the session, type `Ctrl+a d`. To reattach, enter `tmux reattach -t my-project-name`. To kill a session, attach to it and type `Ctrl-a x`.


### Vim

Vim is my text editor of choice. 

To manage vim plugins, I prefer [vim-plug](https://github.com/junegunn/vim-plug).
Everything necessary for vim-plug to work is given in `.vim/autoload/plug.vim`. The vim-plug section of `.vimrc` lists plugins with `Plug` commands which can be installed in vim with `:PlugInstall!`.


### Zsh

Zsh is a Unix shell which is more customizable than bash.

To get up and ready quickly with zsh, I use [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) and specify my personal theme in `zsh/custom/themes/nsgrantham.theme`. 
Among several helpful zsh plugins given in `.zshrc`, my favorite is [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/) which highlights valid commands in green (invalid in red) and underlines valid file paths.
