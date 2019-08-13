# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="./bin:%HOME/bin:/usr/local/n/versions/node/:$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:$HOME/.local/bin:/usr/local/bin:/usr/local/bin:/opt/local/bin/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/scripts:/opt/local/sbin:/usr/local/share/npm/bin:/Developer/usr/bin:/usr/local/share/python:$HOME/.cabal/bin:$HOME/bin:$HOME/.cabal/bin:/usr/local/lib:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"
# export PATH="$PATH:/usr/local/go/bin"


export GOPATH=$HOME/dev/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"
eval "$(fasd --init auto)"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

alias be="bundle exec"
alias bx="bundle exec"
alias buf="CGO_ENABLED=1 buffalo"
alias bd="CGO_ENABLED=1 buffalo dev"
bindkey -e
#bindkey '\e[1;5C' forward-word
#bindkey '\e[1;5D' backward-word
#bindkey '^[[1;5C' emacs-forward-word
#bindkey '^[^[[D' emacs-backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
#bindkey ';5D' backward-word
#bindkey ';5C' forward-word

#alias docker-default="eval $(docker-machine env default)"
#alias docker-up="eval $(docker-machine env dev)"
#docker-up
#alias docker-swap="unset ${!DOCKER_*}"

# #For go on ubuntu 16.04
export CGO_ENABLED=0
export EDITOR='vim'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

_direnv_hook() {
    eval "$(direnv export zsh)";
}
typeset -ag precmd_functions
if [[ -z $precmd_functions[(r)_direnv_hook] ]]; then
    precmd_functions+=_direnv_hook;
fi
export PATH="/usr/local/opt/openssl/bin:$PATH"

alias robert-dunning-junior="dunning-service"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
