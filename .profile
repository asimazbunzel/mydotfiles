# Adds ~/.scripts and all subdirectories to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="$PATH:$HOME/.mesa_tools"  # MESA scripts frequently used
export PATH="/opt/anaconda3/bin:$PATH" # Anaconda setop
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
eval "$(rbenv init -)"

# Definitions of env variables for user
export TERMINAL="st"
export EDITOR="nvim"
export BROWSER="brave-browser-stable"
export READER="zathura"
export FILE="ranger"
export PAGER="less"
export SUDO_ASKPASS="$HOME/.scripts/tools/dmenupass"

# Add shortcuts
if [ ! -f ~/.config/shortcutrc ] || [ ! -f ~/.local/share/mesarc ]; then
    shortcuts
fi

# Interactive python bindings (see docs in ~/.config/python/python-startup)
export PYTHONSTARTUP="$HOME/.config/python/python-startup.py"

# Add locations to PYTHONPATH for my MESA tools
export PYTHONPATH="$HOME/.mesa_tools"

# MESA settings
#export MESA_DIR=$HOME/Developments/mesa-r10398
#export MESASDK_ROOT=$HOME/Developments/mesasdk-r10398
#export MESA_CACHES_DIR=$HOME/.mesa_caches
