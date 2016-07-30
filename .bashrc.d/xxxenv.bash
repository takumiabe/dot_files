if [ -d $HOME/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
fi

if which rbenv > /dev/null; then
    eval "$(rbenv init -)"
fi

if which phpenv > /dev/null; then
    # 同居させるには、rbenvはphpenvよりも前にないといけないので末尾に。
    eval "$(phpenv init -)"
fi
