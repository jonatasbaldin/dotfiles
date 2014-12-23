# Jojo's .bashrc file

# lazzy python
alias p='python'

# get my lab DNS list
alias dns='ssh root@rasp-01 "tail -n+11 /etc/bind/db.labjonatas.com"'

# Disables flow-control chars, for VIM c-s save
/bin/stty -ixon -ixoff 
