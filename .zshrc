# -----------------------------------------------------------------------------
# ZSH Configuration
# -----------------------------------------------------------------------------
export ZSH=/Users/jonatasbaldin/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git git-extras python docker docker-machine docker-compose websearch catimg z golang osx)
source $ZSH/oh-my-zsh.sh


# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------
# Homebrew ctags
alias ctags='/usr/local/bin/ctags'


# -----------------------------------------------------------------------------
# Functions
# -----------------------------------------------------------------------------
# Generates ctags for Python (with packages and libs dir)
# Should be run inside the project file
# If there's a Pipfile, will use pipenv's virtual env
# If not, have your virutalenv activated!
function py_ctags() {
  if [[ -f "Pipfile" ]]; then
    ctags -R -f .tags --exclude=.git --fields=+l --languages=python --python-kinds=-iv $(pipenv run python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")
  else
    ctags -R -f .tags --exclude=.git --fields=+l --languages=python --python-kinds=-iv $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))")
  fi
}


  # Make magic
  ctags -R --exclude=.git --fields=+l --languages=python --python-kinds=-iv -f $1tags $(python -c "import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))") $1
}


# -----------------------------------------------------------------------------
# Path
# -----------------------------------------------------------------------------
# Golang
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$GOPATH/bin"

# Local bins
export PATH=~/.local/bin:$PATH

# NVM
export NVM_DIR="/Users/jonatasbaldin/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Travis
[ -f /Users/jonatasbaldin/.travis/travis.sh ] && source /Users/jonatasbaldin/.travis/travis.sh


# -----------------------------------------------------------------------------
# Misc
# -----------------------------------------------------------------------------
# Lang configuration
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Pyenv configuration
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
