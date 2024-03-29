# Translated to zsh from Ben Hosking's git_cwd_info script
# https://github.com/benhoskings/dot-files/blob/master/files/bin/git_cwd_info
#
print_git_prompt() {
    if git ls-files >& /dev/null ; then

        branch="%{\e[34m%}$(git_branch)%{\e[0m%}"
        sep="%{\e[90m%}@%{\e[0m%}"
        sha="%{\e[33m%}$(git_sha)%{\e[0m%}"
        tangent="$(git_tangent)"

        prompt="$branch$sep$sha"

        # append the tangent, if there is one
        if [[ ${#tangent} -gt 0 ]] ; then
            prompt="$prompt+$tangent"
        fi

        # add the cwd status
        if [[ $(git_cwd_is_clean) -eq 1 ]] ; then
            prompt="$prompt %{\e[32m%}✔%{\e[0m%}"
        else
            prompt="$prompt %{\e[31m%}✘%{\e[0m%}"
        fi

        print "$prompt "

    fi
}

git_branch() {
    git branch | awk '/\*/' | sed -e 's/\* //'
}

git_sha() {
    git rev-parse --short HEAD 2>/dev/null
}

git_tangent() {
    if [[ $(git_is_rebasing) -eq 1 ]] ; then
        print 'rebasing'

    elif [[ $(git_is_bisecting) -eq 1 ]] ; then
        print 'bisecting'

    elif [[ $(git_is_merging) -eq 1 ]] ; then
        print 'merging'

    elif [[ $(git_is_cherry_picking) -eq 1 ]]; then
        print 'cherry-picking'

    fi
}

git_repo_path() {
    git rev-parse --git-dir 2>/dev/null
}

git_num_modified_files() {
    git ls-files -m | wc -l | sed -e 's/^ *//'
}

git_is_rebasing() {
    rebasing_files=("$(git_repo_path)/rebase"
                    "$(git_repo_path)/rebase-apply"
                    "$(git_repo_path)/rebase-merge")

    for rebasing_file in $rebasing_files; do
        if [[ -f $rebasing_file ]] ; then
            print 1 && return
        fi
        if [[ -d $rebasing_file ]] ; then
            print 1 && return
        fi
    done
}

git_is_bisecting() {
    if [[ -f "$(git_repo_path)/BISECT_LOG" ]] ; then
        print 1
    fi
}

git_is_merging() {
    if [[ -f "$(git_repo_path)/MERGE_HEAD" ]] ; then
        print 1
    fi
}

git_is_cherry_picking() {
    if [[ -f "$(git_repo_path)/CHERRY_PICK_HEAD" ]] ; then
        print 1
    fi
}

git_cwd_is_clean() {
    if [[ $(git_num_modified_files) -eq 0 ]]; then
        print 1
    else
        print 0
    fi
}
