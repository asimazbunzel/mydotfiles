# defaults
export TERMINAL="st"
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR="nvim"
export PAGER="less"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER="brave"

# XDG variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# miniconda
[ -d $HOME/.local/bin/conda ] && eval "$(/home/asimazbunzel/.local/bin/conda/bin/conda shell.bash hook)"

# shortcuts
[ ! -f ${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc ] && shortcuts >/dev/null 2>&1 &

# mesainit activate mesa software
[ -f "$HOME/.local/bin/mesainit" ] && source "$HOME/.local/bin/mesainit"
