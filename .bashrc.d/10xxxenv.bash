if [ -d $HOME/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
fi

if which direnv > /dev/null; then
  eval "$(direnv hook bash)"
fi

if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
    export RUBY_BUILD_CACHE_PATH=$(rbenv root)/srcs
fi

if which phpenv > /dev/null; then
    # 同居させるには、rbenvはphpenvよりも前にないといけないので末尾に。
    eval "$(phpenv init -)"
fi

if which nodenv > /dev/null; then
  eval "$(nodenv init -)"
fi

if [[ -d $HOME/.goenv ]]; then
    export PATH="$HOME/.goenv/bin:$PATH"
fi

if which goenv > /dev/null; then
    export GOENV_ROOT="$HOME/.goenv"
    eval "$(goenv init -)"
fi