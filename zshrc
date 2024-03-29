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

export WORDCHARS='*?[]~&;!$%^<>'

PROMPT=$'%{\e[1;30m%}%c%{\e[0m%} $(print_git_prompt)%{\e[1;30m%}☛ %{\e[0m%}'
# PROMPT=$'$(print_git_prompt)%{\e[1;30m%}%c ☛ %{\e[0m%}'
# RPROMPT=$'$(print_git_prompt)'

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

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
