
alias ls="ls -hN --color=auto --group-directories-first --ignore=*.o --ignore=*.pyc" \
   ll='ls -l' \
   la='ls -A' \
   l='ls -CF'
alias e="$EDITOR" \
   v="$EDITOR" \
   vim="nvim" \
   vimdiff="nvim -d" \
   r="ranger" \
   m="mutt" \
   z="zathura"
alias dw="cd $HOME/Downloads && ls -a" \
   docs="cd $HOME/Documents && ls -a" \
   prj="cd $HOME/Projects && ls -a" \
   pa="cd $HOME/Documents/papers && ls -a" \
   tux="cd $HOME/Documents/bin2bbh/evolution/tux && ls -a" \
   github="cd $HOME/Documents/github && ls -a" \
   dots="cd $HOME/Documents/github/dotfiles && ls -a" \
   dev="cd $HOME/Developments && ls -a"
alias df="df -h" \
   grep="grep --color=auto" \
   ssh="ssh -X" \
   ipython="ipython --no-confirm-exit" \
   nano="nano -Sl"

alias plotdig="java -Xmx128m -jar $HOME/.local/bin/plot_digitizer/PlotDigitizer.jar 2>/dev/null"

# extractor
extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar x $1     ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *.exe)       cabextract $1  ;;
          *)           echo "'$1': unrecognized file compression" ;;
      esac
  else
      echo "'$1' is not a valid file"
  fi
}

function cp_to_xrays () {
    scp -r $1 asimazbunzel@xrays.fcaglp.unlp.edu.ar:$2
}
function cp_to_xmm () {
        scp -r $1 asimazbunzel@xmm-newton.fcaglp.unlp.edu.ar:$2
}

