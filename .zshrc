# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/jonatasbaldin/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git python docker git-extras websearch catimg z)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
# Miscellaneous
# -----------------------------------------------------------------------------
# Disables flow-control chars, for vim c-s save
/bin/stty -ixon -ixoff
# Virtualenvwrapper needed configurations
export WORKON_HOME=~/python_envs
mkdir -p $WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh


# -----------------------------------------------------------------------------
# Path
# -----------------------------------------------------------------------------
export GOPATH="$HOME/code/go"
export PATH="$PATH:$GOPATH/bin"

export NVM_DIR="/Users/jonatasbaldin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
