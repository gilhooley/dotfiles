#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
# export PATH=/usr/local/bin:/usr/local/sbin:$PATH
# export PATH=$PATH:/usr/local/bin
# export PYTHONPATH=$HOME:/lib/python2.7/site-packages
ssh-add -A &> /dev/null
