# zplug
source ~/.zplug/init.zsh

# Dependencies
# - fzy
# - rbenv
# - nvm
# - zsh-completions

# plugins
zplug "geometry-zsh/geometry", as:theme

# 補完
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2  
zplug "zsh-users/zsh-completions"

zplug "b4b4r07/enhancd", use:init.sh, if:"which fzy"

zplug load

# alias
alias vi="nvim"
alias vim="nvim"
alias ls='ls --color=auto'

# path
export GOPATH=$HOME/Programs/go

# 今度整理する
# export PATH="$GOPATH/bin:$HOME/.rbenv/shims:$PATH"
# eval "$(rbenv init -)"
