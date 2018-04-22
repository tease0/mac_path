export PATH=/usr/local:$PATH#vim用
export PATH=$HOME/.nodebrew/current/bin:$PATH#nodejs
export PATH="/Library/TeX/texbin:$PATH"#tex


git_branch() {
  echo $(git branch --no-color 2>/dev/null | sed -ne "s/^\* \(.*\)$/\1/p")
}
PS1='\[\033[36m\]\u\[\033[0m\]\[\033[32m\]\w\[\033[0m\]:\[\033[35m\]$(git_branch)\[\033[0m\] $ '

alias ls='ls -G'
alias cot='open $1 -a "/Applications/CotEditor.app"'
alias sudo='sudo '
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

eval "$(goenv init -)"

#historyの設定
HISTSIZE=5000       # 現在使用中のbashが保持する履歴数
HISTFILESIZE=5000   # 履歴ファイルに保存される履歴数
HISTCONTROL=ignoreboth    # ignoredupsとignorespaceどちらも設定する
HISTIGNORE=ls*:history*     # historyは記録しない。
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '
