export HISTFILE=${HOME}/.zsh_history
# number of commands in memoery
export HISTSIZE=1000000
# number of commands in file
export SAVEHIST=100000000

# https://unix.stackexchange.com/questions/568907/why-do-i-lose-my-zsh-history
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# save directory history
setopt AUTO_PUSHD

# limit history size
DIRSTACKSIZE=100

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(sheldon source)"
eval "$(starship init zsh)"

export PATH="$HOME/.local/bin:$PATH"

# Added by Windsurf
export PATH="~/.codeium/windsurf/bin:$PATH"

PER_DIRECTORY_HISTORY_TOGGLE='^T'
