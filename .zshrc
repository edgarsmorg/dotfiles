# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="mytheme"

plugins=( 
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    fzf
)

source $ZSH/oh-my-zsh.sh

# Set-up icons for files/directories in terminal using lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias buk='cd ~/chamba/buk-webapp && zellij'
alias codex-buk='CODEX_HOME=$HOME/.codex-buk codex'
alias memoria='cd ~/uni/memoria'
alias bat='batcat'
alias ssh='kitten ssh'
alias wifi-rescan='nmcli device wifi rescan'

export EDITOR=nvim

# rbenv setup
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# nodenv setup
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$(npm config get prefix)/bin:$PATH"

# direnv
eval "$(direnv hook zsh)"


# opencode
export PATH=/home/edgarmorales/.opencode/bin:$PATH
