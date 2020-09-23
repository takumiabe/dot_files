
if [[ "$(uname)" = "Linux" ]] && [[ -d $HOME/.linuxbrew ]] ; then
  export PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
  export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
  export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
  export XDG_DATA_DIRS="$HOME/.linuxbrew/share:$XDG_DATA_DIRS"
  export LD_LIBRARY_PATH="$HOME/.linuxbrew/lib:$LD_LIBRARY_PATH"
fi

if which brew > /dev/null; then
    # PREFIX=`brew --prefix`
    PREFIX=$HOME/.linuxbrew
    # brew-completion
    if [ -f $PREFIX/Homebrew/completions/bash/brew ]; then
        . $PREFIX/Homebrew/completions/bash/brew
    fi
    for file in $PREFIX/etc/bash_completion.d/* ; do
      . $file
    done
    if which fzf > /dev/null; then
      [ -f `brew --prefix fzf`/shell/completion.bash ] && . `brew --prefix fzf`/shell/completion.bash
      [ -f `brew --prefix fzf`/shell/key-bindings.bash ] && . `brew --prefix fzf`/shell/key-bindings.bash
    fi
fi
