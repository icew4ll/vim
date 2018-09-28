# expansion
touch {t1,t2,t3}.txt

# switch shell zsh
chsh -s /usr/bin/bash

# install fish plugin manager
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher

# usage
fisher nvm fzf

# install theme
curl -L https://get.oh-my.fish | fish
omf install ocean

# install fzf utils for fish
__fzf_install

# fisher list all
fisher ls

# fisher update all
fisher up

# keybindings
Ctrl-t	Ctrl-f	Find a file.
Ctrl-r	Ctrl-r	Similar to ^
Ctrl-x	Alt-x	Does the reverse isearch, and immediately executes command.
Alt-c	Alt-d	cd into sub-directories (recursively searched).
Alt-Shift-c	Alt-Shift-d	cd into sub-directories, including hidden ones.

# check nvm versions
nvm ls-remote

# install
nvm install 7.5.0
nvm alias default 7.5.0
nvm use default

# check install node versions via nvm
nvm ls
node -v

