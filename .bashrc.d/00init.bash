# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# sharing history each bash instances
function share_history {
    history -a
    history -c
    history -r
}
PROMPT_COMMAND='share_history'

# append to the history file, don't overwrite it
shopt -s histappend

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoredups:ignorespace

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTIGNORE="fg*:bg*:history*:cd*:ls:ll"
export LANG=ja_JP.UTF-8

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
