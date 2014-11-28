# COMPLETION
zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${LS_COLORS}

autoload -Uz compinit
compinit
