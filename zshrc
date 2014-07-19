# https://github.com/jcorbin/zsh-git
setopt promptsubst
autoload -U promptinit
promptinit
autoload -U colors && colors

autoload -Uz compinit
compinit

export TERM='xterm-color'

# just reset the fucking path so I know what's on it
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin
export PATH=/usr/local/opt/ruby/bin:$PATH

export WORDCHARS='*?[]~&;!$%^<>'

PROMPT=$'%{\e[1;30m%}%c ☛ %{\e[0m%}'
RPROMPT=$'$(print_git_prompt)'

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

# Load all the configs!
for config_file ($HOME/.zsh/*.zsh) source $config_file
