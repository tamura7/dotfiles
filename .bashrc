alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'
alias hs="history | grep $@ "
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

# --------------------------------------
# Google search from terminal
# --------------------------------------
google(){
    if [ $(echo $1 | egrep "^-[cfs]$") ]; then
        local opt="$1"
        shift
    fi
    local url="https://www.google.co.jp/search?q=${*// /+}"
    local app="/Applications"
    local g="${app}/Google Chrome.app"
    local f="${app}/Firefox.app"
    local s="${app}/Safari.app"
    case ${opt} in
        "-g")   open "${url}" -a "$g";;
        "-f")   open "${url}" -a "$f";;
        "-s")   open "${url}" -a "$s";;
        *)      open "${url}";;
    esac
}

# プロンプトの設定
PS1='\[\e[34m\]\w \[\e[37m\]\$\[\e[0m\] '

#補完
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
