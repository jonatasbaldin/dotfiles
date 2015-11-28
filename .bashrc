# Jojo's .bashrc file

# ALIAS
# lazzy python
alias p='python'
alias p='python3'
# vagrant
alias vssh='vagrant ssh'
alias vup='vagrant up'
alias vdestroy='vagrant destroy'
alias vprov='vagrant provision'
alias vhal='vagrant halt'

# ABSTRACTION FUNCTIONS
# tmux
function tmuxnew() {
  tmux new -s $1
}
function tmuxopen() {
  tmux attach -t $1
}
function tmuxkill() {
  tmux kill-session -t $1
}

# Disables flow-control chars, for VIM c-s save
/bin/stty -ixon -ixoff 

# PATH
export PATH=$PATH:/usr/bin/vsphere
