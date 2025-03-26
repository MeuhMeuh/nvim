# tmux-sessionizer
tmux_sessionizer() {
    tmux-sessionizer
}

# Fuzzy history search
# Old, ça marchait très bien mais la prio du fuzzy était pas ouf
# fzistory () {
#   cmd=$(history 0 | sort -rn | cut -c 8- | tr "\t" " " | uniq -u | fzf --height=7 --layout=reverse --no-sort)
#   zle reset-prompt
#
#   if [ -n "$cmd" ]; then
#     zle -U "$cmd"
#   fi
# }

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

source "$ZSH_CUSTOM/.functions-private.zsh"
