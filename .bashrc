# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------
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
# Homebrew ctags
alias ctags='/usr/local/bin/ctags'


# -----------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------
# Tmux create new session
function tmuxnew() {
  tmux new -s $1
}
# Tmux open created session
function tmuxopen() {
  tmux attach -t $1
}
# Tmux kill session
function tmuxkill() {
  tmux kill-session -t $1
}
# Creates a dir and cd into it
function mkcd() {
  mkdir $1 && cd $1
}
# Generates ctags for Python (with packages and libs dir)
function py_ctags() {
  # $1 must be the full path to the Python project
  # Make sure your virtualenv is actived when running this, otherwhise it will run the default Python interpreter

  # Require $1
  if [[ -z "$1" ]] ; then
      echo "The first parameter must be the full path to the project, with the leading slash!"
      exit 1
  fi

  # Make magic
  ctags -R --exclude=.git --fields=+l --languages=python --python-kinds=-iv -f $1tags $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))") $1
}


# -----------------------------------------------------------------------------
# PATH modifications
# -----------------------------------------------------------------------------
# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"
# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"


# -----------------------------------------------------------------------------
# Environment Variables
# -----------------------------------------------------------------------------
# PS1
PS1="\w(\$(git branch 2> /dev/null | grep "^*" | tr -d '* '))$ "
# vim as my editor, always
export EDITOR=vim


# -----------------------------------------------------------------------------
# Miscellaneous
# -----------------------------------------------------------------------------
# Disables flow-control chars, for vim c-s save
/bin/stty -ixon -ixoff
# Allows Gogh themes
force_color_prompt=yes
# Virtualenvwrapper needed configurations
export WORKON_HOME=~/python_envs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh

# added by travis gem
[ -f /Users/jonatasbaldin/.travis/travis.sh ] && source /Users/jonatasbaldin/.travis/travis.sh
