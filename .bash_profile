# .bashrcの実行（存在する場合）
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

alias ssh="~/.ssh-theme"

# 環境変数の設定
# パス
#export PATH=$PATH:コマンド検索パス

##
# Your previous /Users/tamuraakihiro/.bash_profile file was backed up as /Users/tamuraakihiro/.bash_profile.macports-saved_2017-04-10_at_16:44:05
##


# MacPorts Installer addition on 2017-04-10_at_16:44:05: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
export MANPATH=/opt/local/share/man:$MANPATH

