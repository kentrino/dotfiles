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

zinit wait lucid light-mode for \
    'kentrino/zsh-plugin' \
    'agkozak/zsh-z'

zinit ice blockf
zinit light 'zsh-users/zsh-autosuggestions'
# zinit wait lucid light-mode for \
#   atload"_zsh_autosuggest_start" \
#       zsh-users/zsh-autosuggestions

zinit wait lucid atload"zicompinit; zicdreplay" blockf for \
    'zsh-users/zsh-completions'

eval "$(/opt/homebrew/bin/brew shellenv)"

# Starship 
eval "$(starship init zsh)"

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^j' autosuggest-execute

export GPG_TTY=$(tty)

export PATH="$HOME/.bin:$PATH"
export PATH="$PATH:$HOME/.jetbrains-toolbox"

alias vim="nvim"

source "$HOME/.cargo/env"
export PATH="$PATH":"$HOME/.pub-cache/bin"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


alias date='gdate'

function t() {
    if [ -n "$TMUX" ]; then
        local SELECTED="$(tmux list-sessions | peco | cut -d : -f 1)"
        tmux switch-client -t $SELECTED
        return 0
    else
        local SELECTED="$(tmux list-sessions | peco | cut -d : -f 1)"
        tmux attach-session -t $SELECTED
        return 0
    fi
}

# source "$HOME/.rye/env"
export PATH="${PATH}:${HOME}/.krew/bin"

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
