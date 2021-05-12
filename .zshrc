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

export HISTSIZE=10000
export SAVEHIST=100000

function enter-container {
    CONTAINER_NAME=$1
    if [ -z "$CONTAINER_NAME" ]; then
        echo "You have to specify container name."
        exit 1
    fi 
    CONTAINER=$(docker ps | grep "$CONTAINER_NAME" | awk '{ print $1 }' )
    if [ -z "$CONTAINER" ]; then
        echo "Container not found."
        exit 1
    fi
    docker exec -it $CONTAINER sh
}
