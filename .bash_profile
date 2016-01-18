# Linux aliases
alias alf='ls -alF'

# Git aliases
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gap='git add -p'
alias gb='git branch'
alias gbb='git branch -avv'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gc='git commit'
alias gca='git commit --amend'
alias gci='git clean -i'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gdd='git diff --color-words="[^[:space:]]|([[:alnum:]]|UTF_8_GUARD)+"'
alias gddhh='git diff --color-words="[^[:space:]]|([[:alnum:]]|UTF_8_GUARD)+" HEAD^ HEAD'
alias gdhh='git diff HEAD^ HEAD'
alias gds='git diff --staged'
alias gf='git fetch'
# Usage: "gh 3" or "gh 20"
gh(){ git hist -$1; }
alias ghh='git hist'
# Usage: "gl 3" or "gl 20"
gl(){ git log -$1; }
alias gll='git log'
alias gm='git merge'
alias go='git checkout'
alias gob='git checkout -b'
alias god='git checkout develop'
alias gom='git checkout master'
alias gpl='git pull'
alias gps='git push'
alias grc='git rebase --continue'
alias grid='git rebase -i develop'
alias grim='git rebase -i master'
alias grpo='git remote prune origin'
alias gs='git status -s'
alias gsh='git stash'
alias gsha='git stash apply'
alias gshl='git stash list'
alias gshp='git stash -p'

# Docker aliases
alias di='docker images'

source ~/linux-config/libs/bash-git-prompt/gitprompt.sh
Time12ampm="\$(date +%I:%M)"
GIT_PROMPT_END_USER=" \n${BoldBlue}${Time12ampm}${ResetColor} $ "
GIT_PROMPT_END_ROOT=" \n${BoldBlue}${Time12ampm}${ResetColor} # "
