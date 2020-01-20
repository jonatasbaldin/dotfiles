# -----------------------------------------------------------------------------
# ZSH Configuration
# -----------------------------------------------------------------------------
export ZSH=/Users/jonatasbaldin/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git git-extras python docker docker-machine docker-compose catimg z golang osx kubectl)
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
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1
KUBE_PS1_NS_ENABLE=false
KUBE_PS1_SYMBOL_ENABLE=false
KUBE_PS1_SUFFIX=") "

function get_cluster_short() {
  if [[ "$1" == "gke_jojo-241319_us-central1-a_lab" ]]; then
    echo "lab"
  fi
  if [[ "$1" == "docker-desktop" ]]; then
    echo "dd"
  fi
}

KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jonatasbaldin/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jonatasbaldin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jonatasbaldin/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jonatasbaldin/google-cloud-sdk/completion.zsh.inc'; fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/jonatasbaldin/.nvm/versions/node/v12.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/jonatasbaldin/.nvm/versions/node/v12.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/jonatasbaldin/.nvm/versions/node/v12.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/jonatasbaldin/.nvm/versions/node/v12.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/jonatasbaldin/.nvm/versions/node/v12.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/jonatasbaldin/.nvm/versions/node/v12.11.1/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
