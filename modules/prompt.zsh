# PROMPT
setopt PROMPT_SUBST
autoload -U colors && colors

pwd_basename() {
    echo "$(get_short_path)"
}

PS1='%{$fg_bold[cyan]%}% $(pwd_basename) %(?:%{$fg_bold[green]%}$:%{$fg_bold[red]%}$)$(git_prompt_string) %{$reset_color%}'
