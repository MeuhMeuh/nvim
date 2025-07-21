# .zshrc that was moved to ~/.oh-my-zsh/custom as it's the recommended way to override stuff when using oh my zsh.
export EDITOR='vim'

source "$ZSH_CUSTOM/.env.zsh"
source "$ZSH_CUSTOM/.functions.zsh"
source "$ZSH_CUSTOM/.aliases.zsh"
source "$ZSH_CUSTOM/.path.zsh"

plugins=(direnv)

# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
