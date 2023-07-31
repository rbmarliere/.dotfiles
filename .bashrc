export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export EDITOR="nvim"
export TERM="xterm-256color"

export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE="$HOME/.bash_eternal_history"
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
shopt -s histappend

function parse_git_dirty {
  [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ (\1$(parse_git_dirty))/"
}
export PS1="\t \[\033[01;32m\]\w\[\033[00;33m\]\$(parse_git_branch)\[\033[00m\] $ "

alias ..="cd .."
alias g="git"
alias grep="grep --color=auto"
alias la="ls --color=auto -la"
alias ls="ls --color=auto"

[ -f "$HOME/.aliases" ] && source "$HOME/.aliases"
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash

bind '"\006":"tmux-sessionizer.sh\n"'
