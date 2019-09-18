# -----------------------------------------------------------------------------
# ZSH Configuration
# -----------------------------------------------------------------------------
export ZSH=/Users/jonatasbaldin/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git git-extras python docker docker-machine docker-compose websearch catimg z golang osx kubectl)
source $ZSH/oh-my-zsh.sh

# -----------------------------------------------------------------------------
# Aliases
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Path
# -----------------------------------------------------------------------------
# Golang
export GOPATH="$HOME/go"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$GOPATH/bin"

# Local bins
export PATH=~/.local/bin:$PATH

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

# kube-ps1
source /Users/jonatasbaldin/github/kube-ps1/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT
KUBE_PS1_NS_ENABLE=false
KUBE_PS1_SYMBOL_ENABLE=false
KUBE_PS1_SUFFIX=") "

function get_cluster_short() {
  if [[ "$1" == "gke_jojo-241319_us-central1-a_lab" ]]; then
    echo "lab"
  fi
}

KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short
