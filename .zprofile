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
# __conda_setup="$('/opt/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/opt/conda/etc/profile.d/conda.sh" ]; then
#         . "/opt/conda/etc/profile.d/conda.sh"
#     else
#         export PATH="/opt/conda/bin:$PATH"
#     fi
# fi
# unset __conda_setup
eval "$(/home/asimazbunzel/.local/bin/conda/bin/conda shell.zsh hook)"


# add $HOME/.local/bin to $PATH
# export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | paste -sd ':')"

# add ruby to $PATH
# export PATH="$HOME/.rbenv/bin:$PATH"
# export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
# eval "$(rbenv init -)"

# XDG variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

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
# [ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc ] || [ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/mesarc ] && shortcuts 2>&1 &
# [ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/dirsrc ] || [ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc ] && shortcuts 2>&1 &
