# Enable zinit
# https://github.com/zdharma/zinit
source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

export PATH="$HOME/.bin:$PATH"

zinit ice wait'0'; zinit load 'zsh-users/zsh-autosuggestions'
zinit ice wait'0'; zinit load 'zdharma/fast-syntax-highlighting'
zinit ice wait'0'; zinit load 'zsh-users/zsh-completions'
zinit ice wait'0'; zinit load 'kentrino/zsh-plugin'
zinit ice wait'!0'; zinit load 'agkozak/zsh-z'

autoload -Uz compinit && compinit -i

# Starship 
eval "$(starship init zsh)"

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
