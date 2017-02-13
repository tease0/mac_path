git_branch() {
  echo $(git branch --no-color 2>/dev/null | sed -ne "s/^\* \(.*\)$/\1/p")
}
PS1='\[\033[36m\]\u\[\033[0m\]\[\033[32m\]\w\[\033[0m\]:\[\033[35m\]$(git_branch)\[\033[0m\] $ '


export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

#カラー
export CLICOLOR=1
alias c='pygmentize -O style=solarizedlight -f terminal256 -g -O encoding=utf-8'
alias latexmk='/usr/local/texlive/2015basic/bin/x86_64-darwin/latexmk'

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval

#bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
        . `brew --prefix`/etc/bash_completion
    fi

export PATH=/usr/local/bin:/usr/local/share/python:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export DISPLAY=:0.0
