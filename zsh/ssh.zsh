ssh() {
    echo -e "\033]50;SetProfile=Danger\a"
    /usr/bin/ssh "$@"
    echo -e "\033]50;SetProfile=Default\a"
}
