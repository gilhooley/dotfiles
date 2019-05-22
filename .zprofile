#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
#


# command line tracks current directory and branch, if applicable
precmd () {
  if [ -d .git ]; then
    branch=":: $(git rev-parse --abbrev-ref HEAD)"
  else
    branch=""
  fi;
  print -Pn "\e]2; %1~ $branch\a"
}

#
# Meta
#

# open .zprofile in a text editor
alias prof="atom ~/.zprofile"
# reapply .zprofile without restarting terminal
alias reprof=". ~/.zprofile"
alias fucking="sudo"
alias serve="python -m SimpleHTTPServer"
# alias pip='/Users/katherinegilhooley/Library/Python/3.7/bin/pip'
# alias ngrok="/Users/katherinegilhooley/Applications/ngrok"

name () {
  echo -n -e "\033]0;$1\007"
}

#
# Navigating
#

alias dt="cd ~/Desktop/"
alias proj="cd ~/Desktop/projects"
alias dw="cd ~/Downloads"
alias atl="cd ~/Desktop/projects/atlas-console"

alias rmrf="rm -rf"
mkcd () {
  mkdir $1
  cd $1
}

#
# Git
#

# Master
alias gcm="git checkout master"
alias gpr="git pull --rebase origin master"

# Dev
# alias gcd="git checkout dev"
# alias gpd="git pull --rebase origin dev"

alias gcb="git checkout -b"
alias gh="git hist -10"

#
# npm
#

# Enables tab-completion in all npm commands.
. <(npm completion)

alias nsv="npm install --save"
alias nsd="npm install --save-dev"

nun () {
  ls node_modules;
  for package in `ls node_modules`;
    do npm uninstall $package;
  done;
}

#
# Logging
#

alias v="vagrant"
alias vs="vagrant ssh"
alias vms="VBoxManage list runningvms"

#
# Open apps
#

chr () {
  open -a "Google Chrome" "$1"
}
slack () {
  open -a "Slack"
}


#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='atom'
export VISUAL='nano'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

if [ -f ~/.zshrc ]; then
   source ~/.zshrc
fi

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$USER"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
if [[ ! -d "$TMPPREFIX" ]]; then
  mkdir -p "$TMPPREFIX"
fi


ulimit -n 4096
