#     ▄▄▄▄    ▄▄▄        ██████  ██░ ██  ██▀███   ▄████▄
#    ▓█████▄ ▒████▄    ▒██    ▒ ▓██░ ██▒▓██ ▒ ██▒▒██▀ ▀█
#    ▒██▒ ▄██▒██  ▀█▄  ░ ▓██▄   ▒██▀▀██░▓██ ░▄█ ▒▒▓█    ▄
#    ▒██░█▀  ░██▄▄▄▄██   ▒   ██▒░▓█ ░██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒
#    ░▓█  ▀█▓ ▓█   ▓██▒▒██████▒▒░▓█▒░██▓░██▓ ▒██▒▒ ▓███▀ ░
#    ░▒▓███▀▒ ▒▒   ▓▒█░▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒░ ▒▓ ░▒▓░░ ░▒ ▒  ░
#    ▒░▒   ░   ▒   ▒▒ ░░ ░▒  ░ ░ ▒ ░▒░ ░  ░▒ ░ ▒░  ░  ▒
#     ░    ░   ░   ▒   ░  ░  ░   ░  ░░ ░  ░░   ░ ░
#     ░            ░  ░      ░   ░  ░  ░   ░     ░ ░
#          ░                                     ░

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# source .profile for env variables in interactive mode
if [ ! -z "$PS1" ]; then
    if [ -f ~/.profile ]; then
        source ~/.profile
    fi
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Disable ctrl-s and ctrl-q
stty -ixon

# append to the history file, don't overwrite it
shopt -s histappend

# Infinite history
HISTSIZE= HISTFILESIZE=

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions
if [ -f $HOME/.config/bash/.bash_aliases ]; then
    . $HOME/.config/bash/.bash_aliases
fi
if [ -f "$HOME/.config/shortcutrc" ]; then
    source "$HOME/.config/shortcutrc"
fi
if [ -f "$HOME/.local/share/mesarc" ]; then
    source "$HOME/.local/share/mesarc"
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Fancy prompt
PS1="[\[\033[01;32m\]asb@\h \[\033[00m\]\[\033[01;34m\]\W\[\033[00m\]"
PS1="$PS1\$(__git_ps1 ' \[\033[0;31m\]%s\[\033[00m\]')]\$ "

# git stuff
source $HOME/.config/bash/git-prompt.sh
source $HOME/.config/bash/git-completion.bash

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# MESA stuff
source ~/.local/bin/tools/mesa_init.sh

