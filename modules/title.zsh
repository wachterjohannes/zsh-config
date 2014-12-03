# TITLE
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%~\a"}
        preexec () {print -Pn "\e]0;$1\a"}
        ;;
esac
