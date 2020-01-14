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

# githubで入れたnodenvがあればそちらを優先する
if [[ -d $HOME/.nodenv/bin ]]; then
  export PATH="$HOME/.nodenv/bin:$PATH"
fi
if which nodenv > /dev/null; then
  eval "$(nodenv init -)"
fi

if [[ -d $HOME/.goenv ]]; then
    export PATH="$HOME/.goenv/bin:$PATH"
    eval "$(goenv init -)"
fi

if which goenv > /dev/null; then
    export GOENV_ROOT="$HOME/.goenv"
    eval "$(goenv init -)"
fi

if which pyenv > /dev/null; then
  eval "$(pyenv init -)"
fi
