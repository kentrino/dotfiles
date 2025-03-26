export HISTFILE=${HOME}/.zsh_history
# number of commands in memoery
export HISTSIZE=1000000
# number of commands in file
export SAVEHIST=100000000

# https://unix.stackexchange.com/questions/568907/why-do-i-lose-my-zsh-history
setopt HIST_SAVE_NO_DUPS

# ref:
#   https://qiita.com/ykit00/items/94393d4c55b0b659a267
#   https://zenn.dev/rclab/articles/present_my_zshrc
# incompatible with INC_APPEND_HISTORY
setopt SHARE_HISTORY

PATH="$PATH:/opt/homebrew/bin"

if command -v sheldon &>/dev/null; then
    eval "$(sheldon source)"
fi

if command -v starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

# setting for per-directory-history
HISTORY_START_WITH_GLOBAL=true

# spell correction
setopt correct
