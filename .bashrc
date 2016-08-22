# Jojo's .bashrc file

# ALIAS
# Lazzy python
alias p='python'
alias p3='python3'

# Vagrant
alias vgbox='vagrant box'
alias vgconnect='vagrant connect'
alias vgdestroy='vagrant destroy'
alias vgglobal-status='vagrant global-status'
alias vghalt='vagrant halt'
alias vghelp='vagrant help'
alias vginit='vagrant init'
alias vglogin='vagrant login'
alias vgpackage='vagrant package'
alias vgplugin='vagrant plugin'
alias vgprovision='vagrant provision'
alias vgpush='vagrant push'
alias vgrdp='vagrant rdp'
alias vgreload='vagrant reload'
alias vgresume='vagrant resume'
alias vgshare='vagrant share'
alias vgssh='vagrant ssh'
alias vgssh-config='vagrant ssh-config'
alias vgstatus='vagrant status'
alias vgsuspend='vagrant suspend'
alias vgup='vagrant up'
alias vgversion='vagrant version'

# ABSTRACTION FUNCTIONS
# TMUX
function tmuxnew() {
  tmux new -s $1
}
function tmuxopen() {
  tmux attach -t $1
}
function tmuxkill() {
  tmux kill-session -t $1
}

# Creates a dir and cd into it
function mkcd() {
  mkdir $1 && cd $1
}

# Disables flow-control chars, for VIM c-s save
/bin/stty -ixon -ixoff

# PATH
if [[ -d /usb/bin/vsphere ]]; then
    export PATH=$PATH:/usr/bin/vsphere
fi

# EDITOR
export EDITOR=vim

# PS1
PS1="$(echo :soon: | emojify):\w(\$(git branch 2> /dev/null | grep "^*" | tr -d '* '))$ "


# Ruby env
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Allows Gogh themes
force_color_prompt=yes

# Virtualenvwrapper
export WORKON_HOME=~/python_envs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh
