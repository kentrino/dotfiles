# Enable zinit
# https://github.com/zdharma/zinit
source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

export PATH="$HOME/.bin:$PATH"

zinit light 'zsh-users/zsh-autosuggestions'
zinit light 'zdharma/fast-syntax-highlighting'
zinit light 'zsh-users/zsh-completions'
zinit light 'kentrino/zsh-plugin'
zinit load 'agkozak/zsh-z'

autoload -Uz compinit && compinit -i

# Starship 
eval "$(starship init zsh)"

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
