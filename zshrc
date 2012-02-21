# https://github.com/jcorbin/zsh-git
setopt promptsubst
autoload -U promptinit
promptinit
autoload -U colors && colors

autoload -Uz compinit
compinit

autoload -U zgitinit
zgitinit


alias ls='ls -G'

alias l='ls'
alias la='ls -a'
alias ll='ls -lh'
alias lla='ll -a'

alias r='script/rails'
alias spec=rspec

# Git aliases
alias st='git st'
alias gl='git l'
alias ga='git add'
alias gaa='git add --all'

alias mvim='mvim'
alias vim='mvim -v'
alias vi=vim

export EMAIL='jasonmichaelroth@gmail.com'

export TERM='xterm-color'

# just reset the fucking path so I know what's on it
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin

# Apple developer toolkit
export PATH=/Developer/usr/bin:$PATH


# Originally from Gary Bernhardt's dotfiles
function minutes_since_last_commit {
  now=`date +%s`
  last_commit="$(git log --pretty=format:'%at' -1 2>/dev/null)"
  if [ $? -eq 0 ]; then
    seconds_since_last_commit=$((now - last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
  else
    echo "-1"
  fi
}


function time_since_last_git_commit_prompt {
	if zgit_inworktree; then
    local MINUTES_SINCE_LAST_COMMIT=`minutes_since_last_commit`
    if [ "$MINUTES_SINCE_LAST_COMMIT" -eq -1 ]; then
      echo "%{\e[0;37m%}uncommitted%{\e[0m%}"
    else
      if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 60 ]; then
        echo "%{\e[31m%}1h+%{\e[0m%}"
      elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 30 ]; then
        echo "%{\e[31m%}$(minutes_since_last_commit)m%{\e[0m%}"
      elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
        echo "%{\e[33m%}$(minutes_since_last_commit)m%{\e[0m%}"
      else
        echo "%{\e[3;34m%}$(minutes_since_last_commit)m%{\e[0m%}"
      fi
    fi
  fi
}


PROMPT=$'%{\e[1;30m%}%c ☛ %{\e[0m%}'
RPROMPT=$'$(git_cwd_info) $(time_since_last_git_commit_prompt)'

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
