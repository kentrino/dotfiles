export HISTFILE=${HOME}/.zsh_history
# in memoery
export HISTSIZE=1000000
# in file for bash
# export HISTFILESIZE=100000
# in file
export SAVEHIST=100000000

# https://unix.stackexchange.com/questions/568907/why-do-i-lose-my-zsh-history
# no duplicate
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY

# record cd
setopt AUTO_PUSHD
DIRSTACKSIZE=100

# install zinit if not exists
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# zinit light-mode for \
#     zdharma-continuum/zinit-annex-as-monitor \
#     zdharma-continuum/zinit-annex-bin-gem-node \
#     zdharma-continuum/zinit-annex-patch-dl \
#     zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Enable zinit
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

export PATH="$HOME/.bin:$PATH"

zinit wait lucid light-mode as'completion' for \
    OMZP::docker/_docker \
    OMZP::docker-compose \
    OMZP::yarn
# download failed
#   OMZP::rustup/_rustup \
#   OMZP::rust/_rust \
#   OMZP::cargo/_cargo

zinit wait lucid for \
    atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
        'zdharma/fast-syntax-highlighting'

zinit wait'!0' lucid light-mode for \
    'kentrino/zsh-plugin' \
    'agkozak/zsh-z'

zinit light 'zsh-users/zsh-autosuggestions'

# Should be placed last?
zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    'zsh-users/zsh-completions'

# Starship 
eval "$(starship init zsh)"

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^j' autosuggest-execute

export GPG_TTY=$(tty)

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$PATH:$HOME/.jetbrains-toolbox"
