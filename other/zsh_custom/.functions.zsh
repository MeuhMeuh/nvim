# tmux-sessionizer
tmux_sessionizer() {
    tmux-sessionizer
}

# Fuzzy history search
fzistory() {
  local selected_cmd
  selected_cmd=$(
    fc -rl 1 \
      | awk '
          {
              orig = $0

              key  = $0
              sub(/^[[:space:]]*[0-9]+[[:space:]]*/, "", key)
              sub(/[[:space:]]+$/, "", key)

              if (!seen[key]++) {
                  print orig
              }
          }
        ' \
      | fzf \
          --height=7 \
          --layout=reverse \
          --prompt='History> ' \
          --tiebreak=index
  )

  zle reset-prompt

  if [[ -n "$selected_cmd" ]]; then
    local actual_cmd
    actual_cmd=$(
      echo "$selected_cmd" \
        | sed -E 's/^[[:space:]]*[0-9]+[[:space:]]*//' \
        | sed -E 's/[[:space:]]+$//'
    )
    zle -U "$actual_cmd"
  fi
}

# fnm (replacement for nvm)
eval "$(fnm env --use-on-cd --shell zsh)"

# zoxide (cd replacement)
eval "$(zoxide init zsh)"

source "$ZSH_CUSTOM/.functions-private.zsh"
