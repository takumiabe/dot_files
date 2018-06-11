# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# .bash.d/ を読む
if [ -d "${HOME}/.bashrc.d" ] ; then
    for f in "${HOME}"/.bashrc.d/*.bash ; do
        [ -x "$f" ] && . "$f" && echo load "$f"
    done
    unset f
fi
