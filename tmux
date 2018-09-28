# source tmux
[prefix] :
source-file ~/.tmux.conf.local

# enable mouse mode
[prefix]:
set -g mouse on

# install tmux
sudo apt install tmux

# install oh my tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# configure tmux @
vim .tmux.conf.local

# Remove all sessions !current one
tmux kill-session -a

# Remove all sessions
tmux kill-server

# split vertical
<C-a> %

# split horizontal
<C-a> "

# rename tab
~,

# default shell
vim .tmux.conf.local
set-option -g default-shell /bin/zsh
pkill tmux
tmux

# install tmux plugin manager (tpm)
# place following @ bottom of .tmux.conf
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'

# Other examples:
# set -g @plugin 'github_username/plugin_name'
# set -g @plugin 'git@github.com/user/plugin'
# set -g @plugin 'git@bitbucket.com/user/plugin'

# Initialize TMUX plugin manager (keep this line at the very bottom of
tmux.conf)
run '~/.tmux/plugins/tpm/tpm'

# reload tmux
tmux source ~/.tmux.conf.local

# copy and paste in tmux
# enter copy mode (select with "v", copy with "y")
[prefix] [
# paste mode
[prefix] ]
