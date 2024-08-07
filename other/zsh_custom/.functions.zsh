# tmux-sessionizer
tmux_sessionizer() {
    tmux-sessionizer
}

# Fuzzy history search
fzistory () {
  cmd=$(history 0 | sort -rn | cut -c 8- | tr "\t" " " | uniq -u | fzf --height=7 --layout=reverse --no-sort)
  zle reset-prompt

  if [ -n "$cmd" ]; then
    zle -U "$cmd"
  fi
}

source "$ZSH_CUSTOM/.functions-private.zsh"
