# KEY BINDINGS
bindkey -e
bindkey '\e[A' history-beginning-search-backward        # down
bindkey '\e[B' history-beginning-search-forward         # up
bindkey '^[[3~' delete-char                             # del
bindkey '^[[1;5C' forward-word                          # ctrl + left
bindkey '^[[1;5D' backward-word                         # ctrl + right
bindkey '^[OH' beginning-of-line                        # pos1
bindkey '^[OF' end-of-line                              # end
