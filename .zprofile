#!/bin/zsh

# defaults
export TERMINAL="st"
export EDITOR="nvim"
export BROWSER="brave"
export READER="zathura"
export PAGER="less"
export FILE="ranger"

export LOCATION="la-plata"

# miniconda
[ -d $HOME/.local/bin/conda ] && eval "$(/home/asimazbunzel/.local/bin/conda/bin/conda shell.zsh hook)"

# add $HOME/.local/bin to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -not -path "*conda*" -not -path "*st*" -not -path "*slack*" -printf %p:)%%:}"

# XDG variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# export WORKDIR_HDD=/workdir-hdd/asimazbunzel
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export LESSHISTFILE="-"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
# export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export LESS=-R

# interactive python bindings (see docs in ~/.config/python/python-startup)
# export PYTHONSTARTUP="$HOME/.config/python/python-startup.py"

# add locations to PYTHONPATH for my MESA tools
export PYTHONPATH="$HOME/.local/bin"

# shortcuts
[ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc ] && shortcuts >/dev/null 2>&1 &
[ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc ] && shortcuts >/dev/null 2>&1 &

# mesainit
[ -f $HOME/.local/bin/mesainit ] && source $HOME/.local/bin/mesainit

# functions for computing compositional changes of a star
[ -f $HOME/.local/bin/mesa/eval_metals ] && source $HOME/.local/bin/mesa/eval_metals
