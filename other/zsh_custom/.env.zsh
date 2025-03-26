export PROJECTS=$HOME/Projects

# vitest/jest debug print limit
export DEBUG_PRINT_LIMIT=100000

# Ollama
export OLLAMA_API_BASE=http://127.0.0.1:11434

source "$ZSH_CUSTOM/.env-private.zsh"

# Avoid corporate-core "NSFC" errors
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
