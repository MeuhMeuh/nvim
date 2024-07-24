alias zshcustom="vim $ZSH_CUSTOM"
alias custom="vim $ZSH_CUSTOM"

alias reload="source $ZSH_CUSTOM/zshrc.zsh"

alias zshrc="v $ZSH_CUSTOM/zshrc.zsh"

alias proj="cd $PROJECTS"

alias editaliases="vim $ZSH_CUSTOM/.aliases.zsh"
alias editenv="vim $ZSH_CUSTOM/.env.zsh"
alias editpath="vim $ZSH_CUSTOM/.path.zsh"
alias editfunctions="vim $ZSH_CUSTOM/.functions.zsh"

# git add -p with unstaged files
alias gs='git status'
alias gpu='git push origin'
alias gapan='git add --intent-to-add . && git add --patch'
alias gapanp='git add --intent-to-add . && git add --patch && gpu'
alias gaman='git add --intent-to-add . && git commit -p'
alias gamanp='git add --intent-to-add . && git commit -p && gpu'
alias gafix='git add --intent-to-add . && git commit -p -m "fix: various fixes"'
alias gafixp='gafix && gpu'
alias galint='git commit -p -m "fix: lint"'
alias galintp='galint && gpu'
alias gasrc='gapan src'

alias kill3009='lsof -i tcp:3009 -t | xargs kill'

alias 1662='ssh debian@166220thave.com'

alias jwt="(yarn --silent --cwd ~/Projects/engagement-api dev:jwt --silent | tail -1 | tr -d '\n' | pbcopy)"
alias jwtcorpocore="/Users/alexis.menard/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/jwt_manipulator-1.0.1/bin/new-jwt-token --sub=3af0e9cd-45ff-448e-af4d-775ee6a6025b"

alias venvactivate='source .venv/bin/activate'

alias awsconnect='aws sso login --sso-session central'

alias uuidgen='uuidgen | tr "[:upper:]" "[:lower:]"'
alias copuuid='uuidgen | pbcopy'

alias c='clear'

alias vim='$(which nvim)'
alias v='vim'
alias dev='tmux a -t dev'
alias startdev='tmux new -s dev'
alias tmuxkillall='tmux ls -F "#S" | xargs -n 1 tmux kill-session -t'
alias nvimconfig='nvim ~/.config/nvim'
alias tmuxconfig='nvim ~/.tmux.conf'

zle -N tmux_sessionizer
bindkey '^P' tmux_sessionizer

zle -N fzistory
bindkey '^R' fzistory
bindkey '^F' history-incremental-pattern-search-backward

source "$ZSH_CUSTOM/.aliases-private.zsh"
