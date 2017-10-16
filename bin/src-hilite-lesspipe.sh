#! /bin/sh

style=esc256.style

for source in "$@"; do
    case $source in
    *ChangeLog|*changelog)
        source-highlight --failsafe -f esc --lang-def=changelog.lang --style-file=$style -i "$source" ;;
    *Makefile|*makefile)
        source-highlight --failsafe -f esc --lang-def=makefile.lang --style-file=$style -i "$source" ;;
    *.tar|*.tgz|*.gz|*.bz2|*.xz)
        if which lesspipe.sh > /dev/null; then
          lesspipe.sh "$source"
        else
          echo "archive file"
        fi
        ;;
    *)
        source-highlight --failsafe --infer-lang -f esc --style-file=$style -i "$source" ;;
    esac
done
