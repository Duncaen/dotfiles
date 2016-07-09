[ -x /usr/bin/git ] || return
alias ga='git add'
alias gc='git commit'
alias gca='git commit --amend'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gs='git status -sb'
alias gb='git branch'
alias gd='git diff'
alias gl='git l'

fzgl() {
	git show $(git log --pretty=oneline -n 20 --abbrev-commit | fzy | awk '{print $1}')
}
