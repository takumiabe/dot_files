
# for yarn
# to install
# curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
if [ -d $HOME/.yarn/ ]; then
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi
