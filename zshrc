# https://github.com/jcorbin/zsh-git
setopt promptsubst
autoload -U promptinit
promptinit
autoload -U colors && colors

autoload -Uz compinit
compinit

alias ls='ls -G'
alias ll='ls -lh'
alias lla='ll -a'

alias r='script/rails'
alias sc='script/console'
alias fs='foreman start'

# Git aliases
alias g='git'
alias st='g st'
alias l='g l'
alias la='g la'
alias lr='g lr'
alias lar='g lar'

alias mvim='mvim'
alias vim='mvim -v'
alias vi=vim

# Load all the configs!
for config_file ($HOME/.zsh/*.zsh) source $config_file

export EMAIL='jasonmichaelroth@gmail.com'

export TERM='xterm-color'

# just reset the fucking path so I know what's on it
export PATH=$HOME/bin:$HOME/.dotfiles/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin

# Apple developer toolkit
export PATH=/Developer/usr/bin:$PATH

export WORDCHARS='*?[]~&;!$%^<>'


PROMPT=$'%{\e[1;30m%}%c ☛ %{\e[0m%}'
RPROMPT=$'$(git_cwd_info)'

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
# from http://www.zsh.org/mla/users/2003/msg00335.html
setopt    appendhistory
setopt    extendedhistory
setopt    histexpiredupsfirst
unsetopt  histignorealldups
setopt    histignoredups
setopt    incappendhistory
setopt    sharehistory
