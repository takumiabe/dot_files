
alias l='ls -CF'
alias ls='ls -G'
alias la='ls -A'
alias ll='ls -l'
alias lll='ls -la'
alias grep='grep --color=auto'
# alias sed='gsed'
alias diff='colordiff'

# # SSH bgcolor (use $PRODUCTION_HOST)
# alias ssh='$HOME/dot_files/ssh-host-color'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# decorate less by GNU source-highlight
if which source-highlight > /dev/null; then
  export LESS='-R'
  export LESSOPEN='| ~/dot_files/bin/src-hilite-lesspipe.sh %s'
fi
