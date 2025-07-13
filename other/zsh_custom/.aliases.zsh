alias 1662='ssh debian@166220thave.com'

alias awsconnect='aws sso login --sso-session central'

alias bersp='bundle exec rspec'

alias c='clear'

alias copuuid='uuidgen | pbcopy'

alias custom="vim $ZSH_CUSTOM"

alias dev='tmux a -t dev'

alias editaliases="vim $ZSH_CUSTOM/.aliases.zsh"
alias editaliasesprivate="vim $ZSH_CUSTOM/.aliases-private.zsh"
alias editfunctions="vim $ZSH_CUSTOM/.functions.zsh"
alias editfunctionsprivate="vim $ZSH_CUSTOM/.functions-private.zsh"
alias editenv="vim $ZSH_CUSTOM/.env.zsh"
alias editpath="vim $ZSH_CUSTOM/.path.zsh"

alias gafix='git add --intent-to-add . && git commit -p -m "fix: various fixes"'
alias gafixp='gafix && gpu'
alias galint='git commit -p -m "fix: lint"'
alias galintp='galint && gpu'
alias gaman='git add --intent-to-add . && git commit -p'
alias gamanp='git add --intent-to-add . && git commit -p && gpu'
alias gapan='git add --intent-to-add . && git add --patch'
alias gapanp='git add --intent-to-add . && git add --patch && gpu'
alias gasrc='gapan src'

alias gc-='git checkout -'
alias gcb='git checkout -b'
alias gch='git checkout'
alias gcm='git checkout master'
alias gcmp='git checkout master && git pull origin master && git reset --hard origin/master'
alias gcs='git checkout staging'
alias gcsp='git checkout staging && git pull origin staging && git reset --hard origin/staging'

alias gp='echo NOOP' # Overriding nasty git push
# Fonction git pull pour la branche actuelle
function gpo() {
  branch=$(git_current_branch)  # Récupère la branche actuelle une fois
  echo "Running git pull origin $branch"
  git pull origin $branch
}
alias gpom='git checkout master && gfo && git pull origin master && git reset --hard origin/master'
alias gpos='git checkout staging && gfo && git pull origin staging && git reset --hard origin/staging'
alias gpor='git push origin'
alias gpu='git push origin'
alias gpuo='git push origin'

alias grm='git rebase master'

alias gs='git status'

alias gfo='git fetch origin --prune'

alias jwt="(yarn --silent --cwd ~/Projects/engagement-api dev:jwt --silent | tail -1 | tr -d '\n' | pbcopy)"
alias jwtcorpocore="/Users/alexis.menard/.rbenv/versions/3.1.2/lib/ruby/gems/3.1.0/gems/jwt_manipulator-1.0.1/bin/new-jwt-token --sub=3af0e9cd-45ff-448e-af4d-775ee6a6025b"

alias kill3009='lsof -i tcp:3009 -t | xargs kill'

alias nvimconfig='nvim ~/.config/nvim'

alias proj="cd $PROJECTS"

alias reload="source $ZSH_CUSTOM/zshrc.zsh"

alias startdev='tmux new -s dev'

alias tmuxconfig='nvim ~/.tmux.conf'
alias tmuxkillall='tmux ls -F "#S" | xargs -n 1 tmux kill-session -t'

alias uuidgen='uuidgen | tr "[:upper:]" "[:lower:]"'

alias v='vim'
alias venvactivate='source .venv/bin/activate'
alias vim='$(which nvim)'

alias yt='yarn test'

alias zshcustom="vim $ZSH_CUSTOM"
alias zshrc="v $ZSH_CUSTOM/zshrc.zsh"


# Configuration des raccourcis clavier
zle -N tmux_sessionizer
bindkey '^P' tmux_sessionizer

zle -N fzistory
bindkey '^R' fzistory
bindkey '^F' history-incremental-pattern-search-backward

# Inclusion d'aliases et de configurations privés
source "$ZSH_CUSTOM/.aliases-private.zsh"

