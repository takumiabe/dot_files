
if [[ "$(uname)" = "Linux" ]] && [[ -d $HOME/.linuxbrew ]] ; then
  export PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
  export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
  export XDG_DATA_DIRS="$HOME/.linuxbrew/share:$XDG_DATA_DIRS"
  export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
fi

if which brew > /dev/null; then
    # brew-completion
    if [ -f `brew --prefix bash-completion@2`/share/bash-completion/bash_completion ]; then
      . `brew --prefix bash-completion@2`/share/bash-completion/bash_completion
    fi
    if [ -f `brew --prefix`/share/bash-completion/bash_completion ]; then
      . `brew --prefix`/share/bash-completion/bash_completion
    fi
    if which fzf > /dev/null; then
      [ -f `brew --prefix fzf`/shell/completion.bash ] && . `brew --prefix fzf`/shell/completion.bash
      [ -f `brew --prefix fzf`/shell/key-bindings.bash ] && . `brew --prefix fzf`/shell/key-bindings.bash
    fi

    if [ -d "/usr/local/etc/bash_completion.d" ]; then
      for f in /usr/local/etc/bash_completion.d/* ; do
          # symlinkも追う
          ([ -x "$f" ] || [ -L "$f" ]) && source "$f"
      done
      unset f
    fi
fi
