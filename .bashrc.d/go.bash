if [[ -d /usr/local/go/bin ]]; then
  export PATH=$PATH:/usr/local/go/bin
fi

if which go > /dev/null; then
  export GOPATH=$HOME/.go
  export PATH=$(go env GOPATH)/bin:$PATH
fi
