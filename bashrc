export TERM='xterm-color'
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/X11/bin
export WORDCHARS='*?[]~&;!$%^<>'

PS1=$'[\e[1;30m\w\e[0m] '

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# Load all the configs!
for config_file in $HOME/.{bash,sh}/*.*sh
do
    source $config_file
done
