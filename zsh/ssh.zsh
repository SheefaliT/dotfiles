ssh() {
    local previous_profile=$ITERM_PROFILE
    echo -e "\033]50;SetProfile=SSH\a"
    /usr/bin/ssh "$@"
    echo -e "\033]50;SetProfile=$previous_profile\a"
}
