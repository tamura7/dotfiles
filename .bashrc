alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'
alias hs="history | grep $@ "
alias ssh="~/.ssh-theme"
shopt -s autocd

#suffix alias
_suffix_vim=(md markdown txt text tex cc c C cxx h hh java py rb sh)
command_not_found_handle () {
  if [ -f "$1" ];then
    if echo " ${_suffix_vim[*]} "|grep -q "${1##*.}";then
      echo "$cmd is a file, open $cmd with vi..."
      vi "$1"
      return $?
    fi
  fi
  echo "bash: $1: command not found"
  return 127
}

# プロンプトの設定
PS1='\[\e[34m\]\w \[\e[37m\]\$\[\e[0m\] '
PROMPT_COMMAND='echo -ne "\033]0;${HOSTNAME} \007"'

if [ "$(uname)" == 'Darwin' ]; then
	#mac
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
    fi
    if [ -L ${HOME}/.Trash_b ]; then
        alias rm='gmv --backup=numbered --target-directory=${HOME}/.Trash_b'
    fi 
	:
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
	#linux
    if [ -L ${HOME}/.Trash_b ]; then
        alias rm='mv --backup=numbered --target-directory=${HOME}/.Trash_b'
    fi 
	:
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
	#cygwin
	:
else
	:
fi
