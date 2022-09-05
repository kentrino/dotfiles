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

# Enable zinit
# https://github.com/zdharma/zinit
source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

export PATH="$HOME/.bin:$PATH"

zinit wait lucid light-mode as'completion' for \
    OMZP::docker/_docker \
    OMZP::rust/_rust \
    OMZP::cargo/_cargo \
    OMZP::rustup/_rustup \
    OMZP::docker-compose \
    OMZP::yarn

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
