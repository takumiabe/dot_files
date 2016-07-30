
if [ -f /usr/local/etc/bash_completion.d ]; then
    source /usr/local/etc/bash_completion.d/git-prompt.sh
    source /usr/local/etc/bash_completion.d/git-completion.bash
fi

GIT_PS1_SHOWDIRTYSTATE=true
