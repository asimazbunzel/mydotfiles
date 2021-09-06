#!/bin/zsh

# defaults
export TERMINAL="urxvt"
export EDITOR="nvim"
export BROWSER="brave"
export READER="zathura"
export PAGER="less"
export FILE="ranger"
# export SUDO_ASKPASS="$HOME/.local/bin/dmenupass"

# miniconda
eval "$(/home/asimazbunzel/.local/bin/conda/bin/conda shell.zsh hook)"


# add $HOME/.local/bin to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -not -path "*conda*" -printf %p:)%%:}"


# XDG variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export WORKDIR_HDD=/workdir-hdd
export TMUX_TMPDIR="$XDG_RUNTIME_DIR"
export LESSHISTFILE="-"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
# export INPUTRC="${XDG_CONFIG_HOME:-$HOME/.config}/inputrc"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export LESS=-R

# interactive python bindings (see docs in ~/.config/python/python-startup)
# export PYTHONSTARTUP="$HOME/.config/python/python-startup.py"
# add locations to PYTHONPATH for my MESA tools
# export PYTHONPATH="$HOME/.mesa_tools"

# shortcuts
[ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc ] || [ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/mesarc ] && shortcuts 2>&1 &
[ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/dirsrc ] || [ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc ] && shortcuts 2>&1 &
