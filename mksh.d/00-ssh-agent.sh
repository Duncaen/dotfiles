source_ssh_agent() {
  [ -r ~/.cache/ssh-agent-info ] && . ~/.cache/ssh-agent-info
}

check_ssh_agent() {
  test -e "/proc/${SSH_AUTH_SOCK#*.}"
}

[ ! "$SSH_AUTH_SOCK" ] && source_ssh_agent
