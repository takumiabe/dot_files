export PATH="/usr/local/sbin:$PATH"
export PATH="$(brew --prefix mysql-client)/bin":$PATH

# export PKG_CONFIG_PATH=$(find -L /usr/local/opt -name *.pc | xargs ruby -e 'print ARGV.map(&File.method(:dirname)).uniq.join ?:'):$PKG_CONFIG_PATH
