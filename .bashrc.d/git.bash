if [ -f /usr/local/etc/bash_completion.d ]; then
    source /usr/local/etc/bash_completion.d/git-prompt.sh
    source /usr/local/etc/bash_completion.d/git-completion.bash
fi

# git prompt
if [[ "$(type -t __git_ps1)" = "function" ]]; then
    export GIT_PS1_SHOWDIRTYSTATE=true

    HOST="${BGreen}\u@\h${Color_Off}"
    DIR="${BYellow}\w${Color_Off}"
    GIT="${BRed}\$(__git_ps1)${Color_Off}"
    P="${BBlue}\$${Color_Off}" # escape twice

    export PS1="[${HOST} ${DIR}${GIT}]\n${P} "
    unset HOST DIR GIT DOLLAR
fi
